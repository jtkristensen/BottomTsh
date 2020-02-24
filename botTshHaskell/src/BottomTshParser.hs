{-# LANGUAGE TemplateHaskell
           , QuasiQuotes
           , DataKinds
           , KindSignatures
           , PartialTypeSignatures
           , FlexibleContexts
           , FlexibleInstances
           , TypeFamilies
  #-}
{-# OPTIONS_GHC -fno-warn-partial-type-signatures #-}

-- Todo: put something about reduction stack for simplifying types.

module BottomTshParser where

import Pattern
import Rhythm
import BottomTsh
import Lib.Nat   hiding ((+), (-), (*))
import Lib.Fin
import Lib.Nat.List
import Data.Ratio
import Prelude hiding (sequence, seq)

import Language.Haskell.TH hiding (match)
import Language.Haskell.TH.Syntax
import Language.Haskell.TH.Quote
import Instances.TH.Lift

import Text.ParserCombinators.Parsec

data Pt
  = PEvent Volume Pt
  | PAbyss        Pt
  | PAnnex        Pt
  | PEmpty

instance Semigroup Pt where
  PEmpty       <> p = p
  (PEvent v p) <> p' = PEvent v (p <> p')
  (PAbyss   p) <> p' = PAbyss   (p <> p')
  (PAnnex   p) <> p' = PAnnex   (p <> p')

instance Monoid Pt where
  mempty  = PEmpty
  mappend = (<>)

data Rh
  = RTuplet             Integer  Pt
  | RPhrasing [Integer] Integer  Pt
  | RAhead              Rational  Rh
  | RBehind             Rational  Rh
  | RSequence           Rh       Rh
  | RRepeat             Integer  Rh

instance Semigroup Rh where
  (<>) = RSequence

instance Monoid Rh where
  mempty  = RTuplet 1 mempty
  mappend = (<>)

data Bt
  = BtVoice String  Rh
  | BtSim   Bt      Bt
  | BtSeq   Bt      Bt
  | BtLoop  Integer Bt

-- Compile time grid transformation ---

q1, q2 :: Integer -> Integer -> Integer
q1 n m = lcm n m `div` n
q2 n m = q1 m n

ptExtend ::Integer -> Pt -> Pt
ptExtend 0 pt = pt
ptExtend n pt = ptExtend (n - 1) (pt <> annex)
  where annex = PAnnex PEmpty

ptExpand :: Integer -> Pt -> Pt
ptExpand _  PEmpty         = PEmpty
ptExpand n (PEvent v rest) = ptExtend (n - 1) (PEvent v PEmpty) <> ptExpand n rest
ptExpand n (PAbyss   rest) = ptExtend (n - 1) (PAbyss   PEmpty) <> ptExpand n rest
ptExpand n (PAnnex   rest) = ptExtend (n - 1) (PAnnex   PEmpty) <> ptExpand n rest

lExpand :: Int -> [a] -> [a]
lExpand _ [       ] = []
lExpand n (a : as') = (take n (repeat a)) ++ lExpand n as'

rhU :: Rh -> Integer
rhU (RTuplet     m _) = m
rhU (RPhrasing _ m _) = m
rhU (RAhead    q  rh) = lcm (denominator q) (rhU rh)
rhU (RBehind   q  rh) = lcm (denominator q) (rhU rh)
rhU (RSequence r1 r2) = lcm (rhU r1) (rhU r2)
rhU (RRepeat   _  rh) = rhU rh

btU :: Bt -> Integer
btU (BtVoice _ rh) = rhU rh
btU (BtSim  b1 b2) = lcm (btU b1) (btU b2)
btU (BtSeq  b1 b2) = lcm (btU b1) (btU b2)
btU (BtLoop _  bt) = btU bt

rhUp :: Integer -> Rh -> Rh
rhUp n (RTuplet      m ph) = RTuplet                   (n * m) (ptExpand n ph)
rhUp n (RPhrasing ns m ph) = RPhrasing (lExpand n' ns) (n * m) (ptExpand n ph)
  where n' = fromIntegral n
rhUp n (RAhead    q    rh) = RAhead    q  (rhUp n rh)
rhUp n (RBehind   q    rh) = RBehind   q  (rhUp n rh)
rhUp n (RSequence rh1 rh2) = RSequence    (rhUp n rh1) (rhUp n rh2)
rhUp n (RRepeat     t rh ) = RRepeat   t  (rhUp n rh)

btUp :: Integer -> Bt -> Bt
btUp n (BtVoice v rh) = BtVoice v (rhUp n rh)
btUp n (BtSim  b1 b2) = BtSim (btUp n b1) (btUp n b2)
btUp n (BtSeq  b1 b2) = BtSeq (btUp n b1) (btUp n b2)
btUp n (BtLoop t  bt) = BtLoop t (btUp n bt)

btSimL :: Bt -> Bt -> Bt
btSimL b1 b2 = btUp (q2 (btU b1) (btU b2)) b1

btSimR :: Bt -> Bt -> Bt
btSimR b1 b2 = btUp (q1 (btU b1) (btU b2)) b2

btTransformLCM :: Bt -> Bt
btTransformLCM (BtVoice v rh ) = BtVoice v rh
btTransformLCM (BtSim bt1 bt2) = BtSim (btSimL bt1 bt2) (btSimR bt1 bt2)
btTransformLCM (BtSeq bt1 bt2) = BtSeq (btSimL bt1 bt2) (btSimR bt1 bt2)
btTransformLCM (BtLoop t  bt ) = BtLoop t (btTransformLCM bt)

-- Simple Parser ----------------------

lexeme  p = p >>= \x -> spaces >> return x
symbol  s = lexeme (string s)
curly   p = between (symbol "{") (symbol "}") p
bracket p = between (symbol "[") (symbol "]") p
parens  p = between (symbol "(") (symbol ")") p
meter     = parens $ chainl1 num (symbol "," >> return (*))

num :: CharParser u Integer
num = lexeme $ read <$> many1 digit

hexaDigits :: [Char]
hexaDigits = ['0'..'9'] ++ ['a'..'f']

volume :: CharParser u Volume
volume = (choice $ map char hexaDigits) >>= return . toVolume

ident :: CharParser u String
ident = lexeme $ (:) <$> lower <*> many (lower <|> upper <|> digit <|> char '_')

vPat :: CharParser u Pt
vPat = chainr trigger (return (<>)) PEmpty
  where trigger = choice $ map lexeme $
                  [ volume   >>= \v -> return (PEvent v PEmpty)
                  , char '.' >>        return (PAbyss   PEmpty)
                  , char '_' >>        return (PAnnex   PEmpty)
                  ]

vRhythm :: CharParser u Rh
vRhythm = chainr term (return (<>)) (RTuplet 1 PEmpty)
  where
    term     = do r <- choice [ try    vrhythm
                              , parens vRhythm
                              ]
                  f <- times
                  return $ f r
    vrhythm  = phrasing <|> tuplet
    times    = do ns <- many (symbol "x" >> num)
                  return $ foldl (\f x -> f . RRepeat x) id ns
    tuplet   =
      do u <- meter
         f <- pos
         p <- curly vPat
         return $ f $ RTuplet u p
    phrasing =
      do t <- bracket $ many1 num
         u <- meter
         f <- pos
         p <- curly vPat
         return $ f $ RPhrasing t u p
    pos   = option id (ahead <|> behind)
    ahead =
      do symbol "<"
         n1 <- num
         symbol ","
         n2 <- num
         symbol "="
         return $ RAhead (n1 % n2)
    behind =
      do symbol "="
         n1 <- num
         symbol ","
         n2 <- num
         symbol ">"
         return $ RBehind (n1 % n2)

botTshProgram :: CharParser u Bt
botTshProgram =  sim (seq p)
  where p   =   sim (seq assignment) <|> parens botTshProgram
        sim p = chainr1 (parens p <|> p) (symbol ";" >> return BtSeq)
        seq p = chainr1 p (symbol "," >> return BtSim)
        assignment = do s <- ident
                        symbol "<-"
                        rh <-  vRhythm
                        return $ BtVoice s rh

parseProgram :: Monad m => (String, Int, Int) -> String -> m Bt
parseProgram (file, line, col) s =
    case runParser p () "" s of
      Left err  -> fail $ show err
      Right e   -> return e
  where
    p = do  pos <- getPosition
            setPosition $
              (flip setSourceName) file $
              (flip setSourceLine) line $
              (flip setSourceColumn) col $
              pos
            spaces
            n    <- option 1 $
              do symbol "loop"
                 m <- num
                 symbol ":"
                 return m
            prg  <- botTshProgram
            eof
            return $ BtLoop n prg

botTsh  :: QuasiQuoter
botTsh  =  QuasiQuoter
  { quoteExp  = compileProgram
  , quotePat  = notHandled "patterns"
  , quoteType = notHandled "types"
  , quoteDec  = notHandled "declarations"
  }
  where notHandled things = error $
          things ++ " are not handled by the regex quasiquoter."

-- To Haskell Syntax ----------------

-- no anti expression rule, as no instance of `Lift (Q Exp)`

compileProgram :: String -> Q Exp
compileProgram s =  do loc <- location
                       let pos = (loc_filename loc,
                                 fst (loc_start loc),
                                 snd (loc_start loc))
                       prg <- parseProgram pos s
                       -- [ put transformations here ]
                       [e| prg |]

build, call :: Language.Haskell.TH.Syntax.Name -> [Q Exp] -> Q Exp
build n = foldl appE (conE n)
call  n = foldl appE (varE n)

instance Lift Nat where
  lift Zero    = build 'O [      ]
  lift (Suc n) = build 'S [lift n]

data List a
   = EmptyList
   | Cons a (List a)

instance Lift (List Nat) where
  lift EmptyList   = build 'Nil   [               ]
  lift (Cons n ns) = build '(:::) [lift n, lift ns]

instance Lift (Fin n) where
  lift (FZero n) = build 'FZero [lift $ sn2n n]
  lift (FSuc  f) = build 'FSuc  [lift        f]

il2nl :: [Integer] -> List Nat
il2nl [      ] = EmptyList
il2nl (n : ns) = i2n n `Cons` il2nl ns

i2n :: Integer -> Nat
i2n 0 = Zero
i2n n = Suc $ i2n $ n - 1

sn2n :: SNat n -> Nat
sn2n O     = Zero
sn2n (S n) = Suc (sn2n n)

instance Lift Pt where
  lift  PEmpty      = build 'Empty [       ]
  lift (PEvent a p) = build 'Event [ lift a
                                   , lift p]
  lift (PAbyss   p) = build 'Abyss [ lift p]
  lift (PAnnex   p) = build 'Annex [ lift p]

instance Lift Rh where
  lift (RTuplet     i p) = build 'Tuplet   [ lift $ i2n i
                                           , lift p]
  lift (RPhrasing t i p) = build 'Phrase   [ lift $ il2nl t
                                           , lift $ i2n i
                                           , lift p]
  lift (RAhead      q r) = call  'shiftl   [ lift $ i2n $ numerator   q
                                           , lift $ i2n $ denominator q
                                           , lift r ]
  lift (RBehind     q r) = call  'shiftr   [ lift $ i2n $ numerator   q
                                           , lift $ i2n $ denominator q
                                           , lift r ]
  lift (RSequence r1 r2) = call  'sequence [ lift r1
                                           , lift r2]
  lift (RRepeat   t  r ) = build 'Repeat   [ lift $ i2n t
                                           , lift r]

-- Safe but too slow.
instance Lift Bt where
  lift (BtVoice n r  ) = build 'Voice [ lift n
                                      , lift r]
  lift (BtSim bt1 bt2) = call  'sim   [ lift bt1
                                      , lift bt2]
  lift (BtSeq bt1 bt2) = call  'seq   [ lift bt1
                                      , lift bt2]
  lift (BtLoop  t bt ) = build 'Loop  [ lift $ i2n t
                                      , lift bt ]

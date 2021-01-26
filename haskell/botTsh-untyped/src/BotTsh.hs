{-# LANGUAGE
    DeriveFunctor
  , DeriveDataTypeable
  , FlexibleContexts
  , QuasiQuotes
  , TemplateHaskell
#-}

module BotTsh where

import Units

import Data.Generics
import qualified Language.Haskell.TH as TH
import Language.Haskell.TH.Quote

import Text.ParserCombinators.Parsec
import Data.List (elemIndex)

import CSound.Noises
import CSound.Audible
import Pattern
import Rhythm
import Tiled.Polymorphic.Temporal.Media
import       Polymorphic.Temporal.Media

data BotTsh a =
      Voice   Name (Rhythm a)
    | Simultaneous (BotTsh a) (BotTsh a)
    | Sequentially (BotTsh a) (BotTsh a)
    | Loop          Steps   (BotTsh a)
    | AntiBotTsh      String
    deriving (Show, Functor, Data, Typeable)

type Name  = String
type Arg   = Rational
data Event = Sample Name [Arg]
  deriving (Show, Data, Typeable)

lexeme  p = p >>= \x -> spaces >> return x
symbol  s = lexeme (string s)
curly   p = between (symbol "{") (symbol "}") p
bracket p = between (symbol "[") (symbol "]") p
parens  p = between (symbol "(") (symbol ")") p
num       = lexeme $ read <$> many1 digit
meter     = parens $ chainl1 num (symbol "," >> return (*))

volume :: CharParser u Rational
volume = do x <- choice $ map char hexaDigits
            case elemIndex x hexaDigits of
              Just i -> return $ fromIntegral i % 15
              _      -> fail "hexadecimal digit"

hexaDigits :: [Char]
hexaDigits = ['0'..'9'] ++ ['a'..'f']

ident :: CharParser u String
ident = lexeme $ (:) <$> lower <*> many (lower <|> upper <|> digit <|> char '_')


vPat :: Name -> CharParser u (Pattern Event)
vPat s = chainr trigger (return (<>)) Empty
  where trigger = choice $ map lexeme $
                  [ volume >>= \v -> return (Event (Sample s [v]) Empty)
                  , char '.' >> return (Abyss Empty)
                  , char '_' >> return (Annex Empty)
                  ]

vRhythm :: Name -> CharParser u (Rhythm Event)
vRhythm s = chainr term (return Sequence) (Tuplet 1 Empty)
  where
    term     = do r <- choice [ try     vrhythm
                              , parens (vRhythm s)
                              ]
                  f <- times
                  return $ f r
    vrhythm  = phrasing <|> tuplet
    times    = do ns <- many (symbol "x" >> num)
                  return $ foldl (\f x -> f . Repeat x) id ns
    tuplet   =
      do u <- meter
         f <- pos
         p <- curly (vPat s)
         return $ f $ Tuplet u p
    phrasing =
      do t <- bracket $ many1 num
         u <- meter
         f <- pos
         p <- curly (vPat s)
         return $ f $ Phrasing t u p
    pos   = option id (ahead <|> behind)
    ahead =
      do symbol "<"
         n1 <- num
         symbol ","
         n2 <- num
         symbol "="
         return $ Ahead (n1 % n2)
    behind =
      do symbol "="
         n1 <- num
         symbol ","
         n2 <- num
         symbol ">"
         return $ Behind (n1 % n2)

botTshProgram :: CharParser u (BotTsh Event)
botTshProgram = sim (seq p)
  where p   =   (char '$' >> AntiBotTsh <$> ident)
           <|>  sim (seq assignment)
           <|>  parens botTshProgram
        sim p = chainr1 (parens p <|> p) (symbol ";" >> return Sequentially)
        seq p = chainr1 p (symbol "," >> return Simultaneous)
        assignment = do s <- ident
                        symbol "<-"
                        rh <-  vRhythm s
                        return $ Voice s rh

botTsh  :: QuasiQuoter
botTsh  =  QuasiQuoter
  { quoteExp  = quoteProgram
  , quotePat  = notHandled "patterns"
  , quoteType = notHandled "types"
  , quoteDec  = notHandled "declarations"
  }
  where notHandled things = error $
          things ++ " are not handled by the regex quasiquoter."

parseProgram :: Monad m => (String, Int, Int) -> String -> m (BotTsh Event)
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
            return $ Loop n prg

quoteProgram :: String -> TH.ExpQ
quoteProgram s =  do  loc <- TH.location
                      let pos =  (TH.loc_filename loc,
                                 fst (TH.loc_start loc),
                                 snd (TH.loc_start loc))
                      prg <- parseProgram pos s
                      dataToExpQ (const Nothing `extQ` antiBotTshExp) prg

antiBotTshExp :: BotTsh Event -> Maybe (TH.Q TH.Exp)
antiBotTshExp  (AntiBotTsh v) = Just $ TH.varE (TH.mkName v)
antiBotTshExp  _            = Nothing

audible :: Functor f => f Event -> f Audio
audible = fmap (\(Sample s [v]) -> Sound (stereoWavSample s, signal v, []) 1)

evalP :: Pattern Audio -> Media Audio
evalP (Event (Sound s d) (Annex rest)) = evalP (Event (Sound s (d + 1)) rest)
evalP (Event (Sound s d) rest)         = Prim (Sound s d) :+: evalP rest
evalP (Event (Silence d) rest)         = Prim (Silence d) :+: evalP rest
evalP (Abyss rest)                     = Prim (Silence 1) :+: evalP rest
evalP (Annex rest)                     = Prim (Silence 1) :+: evalP rest
evalP Empty                            = none 0

evalR :: Rhythm Audio -> Tiled Audio
evalR (Tuplet     u p)    = let m = scaleM (1 % u) $ evalP p in Tile 0 (dur m) m
evalR (Phrasing t u p)    = let f = scaleM (steps p % (sum t * u))
                                m = f . evalP $ phrase t (groupBy 1 p)
                                in Tile 0 (dur $ m) m
evalR (Sequence r1 r2)    = (evalR r1) %% (evalR r2)
evalR (Ahead  t r)        = delayM t    $ evalR r
evalR (Behind t r)        = delayM (-t) $ evalR r
evalR (Repeat 0 r)        = none 0
evalR (Repeat n r)        = evalR r %% evalR (Repeat (n - 1) r)
-- future work : euclidean rhtyhm.

eval :: BotTsh Event -> Tiled Audio
eval (Voice        _  r ) = evalR (audible r)
eval (Simultaneous p1 p2) = reset (eval p1)  %% eval p2
eval (Sequentially p1 p2) = (eval p1) %% (eval p2)
eval (Loop          0 p ) = none 0
eval (Loop          n p ) = eval p %% (eval (Loop (n - 1) p))
-- no rule for antiBotTsh.

-- Extras:
voices :: BotTsh a -> [Name]
voices (Voice name _)       = [name]
voices (Simultaneous p1 p2) = voices p1 ++ voices p2
voices (Sequentially p1 p2) = voices p1 ++ voices p2
voices (Loop         _  p ) = voices p

mute :: Name -> BotTsh a -> BotTsh a
mute n (Voice m r) = if n == m then Voice n (none $ dur r) else Voice m r
mute n (Simultaneous p1 p2) = Simultaneous (mute n p1) (mute n p2)
mute n (Sequentially p1 p2) = Sequentially (mute n p1) (mute n p2)
mute n (Loop         m  p ) = Loop m (mute n p)

solo :: Name -> BotTsh a -> BotTsh a
solo n p = foldr mute p (filter (/=n) $ voices p)

tracks :: BotTsh a -> [(Name, BotTsh a)]
tracks p = map (\n -> (n, solo n p)) (voices p)

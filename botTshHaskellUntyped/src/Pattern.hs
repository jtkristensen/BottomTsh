{-# LANGUAGE DeriveFunctor
           , DeriveDataTypeable
  #-}

module Pattern where

import Data.Generics
import Polymorphic.Temporal.Media
import Control.Exception.Base (assert)
import CSound.Audible
import Units

data Pattern a =
    Empty
  | Event a (Pattern a)
  | Abyss   (Pattern a)
  | Annex   (Pattern a)
  deriving (Show, Eq, Functor, Data, Typeable)

instance Semigroup (Pattern a) where
  Empty        <> p  = p
  (Event a p1) <> p2 = Event a (p1 <> p2)
  (Abyss   p1) <> p2 = Abyss   (p1 <> p2)
  (Annex   p1) <> p2 = Annex   (p1 <> p2)

instance Monoid (Pattern a) where
  mempty  = Empty
  mappend = (<>)

instance Metrical (Pattern a) where
  unit  _           = 1
  steps  Empty      = 0
  steps (Event _ s) = steps s + 1
  steps (Abyss   s) = steps s + 1
  steps (Annex   s) = steps s + 1

groupBy :: Steps -> Pattern a -> [Pattern a]
groupBy _ Empty = []
groupBy s p     = if   steps p < s
                  then error "non-cannonical form"
                  else l2p (take s' p') : groupBy s (l2p (drop s' p'))
  where
    p2l  Empty      = [id]
    p2l (Event a p) = Event a : p2l p
    p2l (Abyss   p) = Abyss   : p2l p
    p2l (Annex   p) = Annex   : p2l p
    l2p = foldr id Empty
    p'  = p2l p
    s'  = fromIntegral s

collapse :: [Pattern a] -> Pattern a
collapse = foldr (<>) Empty

-- 'a', 'n' over 'm' steps rotated 'r' times.
euclideanPattern :: a -> Steps -> Steps -> Steps -> Pattern a
euclideanPattern a n m r = rotate (m - r `mod` m) p
  where p = expand ((m `div` n) - 1)
          (collapse $ take (fromIntegral n) $ repeat $ Event a Empty) <> extend (m `mod` n)
        rotate 0 l = l
        rotate n l = rotate (n - 1) $ let l' = groupBy 1 l in collapse (tail l') <> head l'

phrase :: [Integer] -> [Pattern a] -> Pattern a
phrase is ps = assert (length is == length ps) $ phrase' is ps
  where
    phrase' [        ] _       = Empty
    phrase' _          [     ] = Empty
    phrase' (s : rest) (r : p) = expand (s - 1) r <> phrase' rest p

expand :: Steps -> Pattern a -> Pattern a
expand _ Empty = Empty
expand s (Event a p) = Event a (extend s) <> expand s p
expand s (Abyss   p) = Abyss   (extend s) <> expand s p
expand s (Annex   p) = Annex   (extend s) <> expand s p

extend :: Steps -> Pattern a
extend n = foldr (const Annex) Empty [1..n]

p2ptm :: Unit -> Pattern a -> Media (Audible a)
p2ptm _ Empty     = none 0
p2ptm u (Event a p) = Prim (Sound a ((annexSteps p + 1) % u)) :+: p2ptm u (unTie p)
p2ptm u (Abyss   p) = none          ((annexSteps p + 1) % u)  :+: p2ptm u (unTie p)
p2ptm u (Annex   p) = none          ((annexSteps p + 1) % u)  :+: p2ptm u (unTie p)

annexSteps :: Pattern a -> Steps
annexSteps (Annex rest) = 1 + annexSteps rest
annexSteps _            = 0

unTie :: Pattern a -> Pattern a
unTie (Annex rest) = unTie rest
unTie p            = p

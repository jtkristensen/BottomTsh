{-# LANGUAGE FlexibleInstances
           , MultiParamTypeClasses
#-}

module Polymorphic.Temporal.Media where

import Units

class Temporal a where
  dur  :: a -> Duration
  none :: Duration -> a

class Metrical a where
  unit  :: a -> Unit
  steps :: a -> Steps

class (Temporal a, Temporal b, Combine b) => Meaning a b where
  meaning :: a -> b

class Take a where
  takeM :: Duration -> a -> a

class Drop a where
  dropM :: Duration -> a -> a

class Reverse a where
  reverseM :: a -> a

class Combine a where
  concatM :: a -> a -> a
  merge   :: a -> a -> a
  zero    :: Duration -> a

class Delay a where
  delayM :: Duration -> a -> a

class Scale a where
  scaleM :: Duration -> a -> a

infixr 4 :+:
infixr 5 :=:

data Media a =
    Prim  a
  | Media a :+: Media a
  | Media a :=: Media a
  deriving (Show, Eq)

cata :: (a -> b) -> (b -> b -> b) -> (b -> b -> b) -> Media a -> b
cata f _ _ (Prim    a) = f a
cata f h g (m1 :+: m2) = cata f h g m1 `h` cata f h g m2
cata f h g (m1 :=: m2) = cata f h g m1 `g` cata f h g m2

instance Functor Media where
  fmap f = cata (Prim . f) (:+:) (:=:)

instance Temporal a => Temporal (Media a) where
  dur  = cata dur (+) max
  none = Prim . none

instance Reverse a => Reverse (Media a) where
  reverseM = cata (Prim . reverseM) (flip (:+:)) (:=:)

instance (Temporal a, Take a) => Take (Media a) where
  takeM d = cata
    (\m     -> if d <= 0 then none 0 else Prim $ takeM d m)
    (\m1 m2 -> let d1 = dur m1
               in (if d <= d1 then takeM d m1 else m1 :+: takeM (d - d1) m2))
    (\m1 m2 -> takeM d m1 :=: takeM d m2)

-- Very complicated to express as a catamorphism (threading 'd' around).
instance (Temporal a, Drop a) => Drop (Media a) where
  dropM d m | d >= (dur m) = none 0
  dropM d (Prim a)    = Prim $ dropM d a
  dropM d (m1 :+: m2) = if d >= d1 then dropM (d - d1) m2 else dropM d m1 :+: m2
    where d1 = dur m1
  dropM d (m1 :=: m2) = dropM d m1 :=: dropM d m2

instance Meaning a b => Meaning (Media a) b where
  meaning = cata meaning concatM merge

instance (Temporal a) => Delay (Media a) where
  delayM d m =
    case compare d 0 of
      GT -> none d :+: m
      EQ -> m
      LT -> m :+: none (-d)

instance (Metrical a, Temporal a) => Metrical (Media a) where
  unit    = cata unit lcm lcm
  steps m = cata (\a -> numerator ((dur a) / (1 % u))) (+) max m
    where u = unit m

instance Metrical Duration where
  steps = numerator
  unit  = denominator

instance Scale a => Scale (Media a) where
  scaleM d = fmap (scaleM d)

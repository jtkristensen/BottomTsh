{-# LANGUAGE
    DeriveFunctor
  , DeriveDataTypeable
  , OverloadedStrings
  , FlexibleContexts
  , TypeFamilies
#-}

module Rhythm where

import Data.Generics
import Pattern
import Units
import Polymorphic.Temporal.Media

-- sfx goes into future work.

data Rhythm a =
    Tuplet             Unit       (Pattern a) -- A tuplet.
  | Phrasing   [Steps] Unit       (Pattern a) -- A phrased tuplet.
  | Sequence   (Rhythm a)         (Rhythm  a) -- Rhythms played afer one another.
  | Ahead       Time              (Rhythm  a) -- Play ahead, but keep logical duration.
  | Behind      Time              (Rhythm  a) -- Play behind, but keep logical duration.
  | Repeat      Steps             (Rhythm  a)
  -- | Euclidean a Steps (Unit, Steps) Steps -- future work.
  deriving (Show, Eq, Functor, Data, Typeable)

instance Temporal (Rhythm a) where
  dur (Tuplet     u p) = steps p % u
  dur (Phrasing _ u p) = steps p % u
  dur (Sequence r1 r2) = dur r1 + dur r2
  dur (Ahead  _ r)     = dur r
  dur (Behind _ r)     = dur r
  dur (Repeat n r)     = (n % 1) * dur r

  none d = Tuplet (denominator d) (foldr (const Abyss) Empty [1..numerator d])

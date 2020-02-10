{-# LANGUAGE
    DeriveFunctor
  , DeriveDataTypeable
#-}

module CSound.Audible where

import Units
import Data.Generics
import Polymorphic.Temporal.Media

data Audible a =
    Sound a Duration
  | Silence Duration
  deriving (Show, Eq, Ord, Functor, Data, Typeable)

instance Temporal (Audible a) where
  none            = Silence
  dur (Sound _ d) = d
  dur (Silence d) = d

instance Metrical (Audible a) where
  unit  = unit  . dur
  steps = steps . dur

instance Take (Audible a) where
  takeM d (Sound a d') = if d >= d' then none 0 else Sound a (d' - d)
  takeM d (Silence d') = if d >= d' then none 0 else Silence (d' - d)

instance Drop (Audible a) where
  dropM = takeM

instance Scale (Audible a) where
  scaleM d (Sound a d') = Sound   a (d' * d)
  scaleM d (Silence d') = Silence   (d' * d)

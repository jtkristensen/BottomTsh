{-# LANGUAGE TypeSynonymInstances
           , FlexibleInstances
  #-}

-- Has its own module to avoid cyclic imports
module CSound.SFX where

import CSound.Noises
import       Polymorphic.Temporal.Media
import Tiled.Polymorphic.Temporal.Media

class SFX a where
  sfx :: FX -> a -> a

instance SFX Audio where
  sfx f = fmap (\(a, v, fs) -> (a, v, f : fs))

instance SFX a => SFX (Media a) where
  sfx f = fmap (sfx f)

instance SFX a => SFX (Tiled a) where
  sfx f = fmap (sfx f)

{-# LANGUAGE TypeSynonymInstances
           , FlexibleInstances
  #-}

module CSound.RenderTPTM where

import Csound.Base ( eff, mul, mix, har, mel, str )
import CSound.Noises
import CSound.Audible
import       Polymorphic.Temporal.Media
import Tiled.Polymorphic.Temporal.Media
import Data.Tuple.Select

runFx :: FX -> Stereo -> Stereo
runFx fsx = eff (return . fsx)

runVolume :: Volume -> Stereo -> Stereo
runVolume v = runFx (mul v)

scale :: Sig -> Track Sig a -> Track Sig a
scale = str

audio2stereo :: Audio -> Stereo
audio2stereo (Silence d) = str (signal d) (rest 1)
audio2stereo (Sound a d) = str (signal d) $
  foldl (\b f -> runFx f b) (runVolume (sel2 a) (sel1 a)) (reverse $ sel3 a)

ptm2stereo :: Media Audio -> Stereo
ptm2stereo m = cata audio2stereo (\m1 m2 -> mel [m1, m2]) (\m1 m2 -> har [m1, m2]) m

runPTM :: BPM -> Media Audio -> Stereo
runPTM b = str (60*4/b) . ptm2stereo

runTPTM :: BPM -> Tiled Audio -> Stereo
runTPTM b tptm = runPTM b $ value $ tptm

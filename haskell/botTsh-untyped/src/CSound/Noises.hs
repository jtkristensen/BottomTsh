module CSound.Noises
  ( Sco, Mix, D, Track, Sig, Volume, BPM, FX, Stereo, Audio
  , stereoWavSample, runStereo, signal, temp, rest )
where

import Csound.Base ( Sco, Mix, D, Track, sco, temp, rest, str, mel)
import Csound.Sam  ( Sample, wav, runSam )
import Csound.Typed.Types.Prim (Sig(..))
import Data.Ratio
import CSound.Audible
import Polymorphic.Temporal.Media

-- Note: Sig2 is just an alias for (Sig, Sig).
type Volume                 = Sig
type BPM                    = Sig
type FX                     = (Sig, Sig) -> (Sig, Sig)
type Stereo                 = Sco (Mix (Sig, Sig))
type Audio                  = Audible (Stereo, Volume, [FX])

stereoWavSample :: String -> Stereo
stereoWavSample file =  runStereo (wav $ "./samples/" ++ file ++ ".wav") (temp 1)

runStereo :: Sample (Sig, Sig) -> Track Sig D -> Stereo
runStereo = sco . const . runSam 60

signal :: Rational -> Sig
signal q = PrimSig $ fromIntegral (numerator q)
                   / fromIntegral (denominator q)

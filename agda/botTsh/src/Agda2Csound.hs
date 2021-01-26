
module Agda2Csound where

import Csound.Base (Sig, Sco, Mix, D, Track, sco, temp, rest
                   , dac, eff, mul, mix, har, mel, str )
import Csound.Sam  (Sample, wav, runSam )
import Csound.Typed.Types.Prim (Sig(..))
import qualified Data.Text as T

data Duration    = Q Integer Integer
type Volume      = Integer
type SampleName  = T.Text
type StereoScore = Sco (Mix (Sig, Sig))
type BPM         = Integer

data AgdaMedia =
    Play SampleName Duration Volume
  | Wait Duration
  | SeqM AgdaMedia AgdaMedia
  | SimM AgdaMedia AgdaMedia

dur :: Duration -> Sig
dur (Q n d) = PrimSig $ fromIntegral n / fromInteger d

vol :: Volume -> Sig
vol = PrimSig . (\n -> n / 15) . fromIntegral

bpm :: BPM -> Sig
bpm = PrimSig . ((/)(60*4)) . fromIntegral

stereoWavSample :: Duration -> SampleName -> Volume -> StereoScore
stereoWavSample d f v =
  eff (return . (mul $ vol v)) $
  str (dur d) $ runStereoScore (wav $ "./samples/" ++ T.unpack f ++ ".wav") (temp 1)

runStereoScore :: Sample (Sig, Sig) -> Track Sig D -> StereoScore
runStereoScore = sco . const . runSam 60

compileAgdaMedia :: AgdaMedia -> StereoScore
compileAgdaMedia (Play s d v) = stereoWavSample d s v
compileAgdaMedia (Wait d    ) = str (dur d) (rest 1)
compileAgdaMedia (SeqM m1 m2) = mel [compileAgdaMedia m1, compileAgdaMedia m2]
compileAgdaMedia (SimM m1 m2) = har [compileAgdaMedia m1, compileAgdaMedia m2]

runAgdaMedia :: BPM -> AgdaMedia -> IO ()
runAgdaMedia b = dac . mix . str (bpm b) . compileAgdaMedia

{-# LANGUAGE DataKinds
           , GADTs
           , KindSignatures
           , TypeOperators
           , TypeSynonymInstances
  #-}

module BottomTsh where

import Lib.Nat hiding ((+), (*))
import Lib.Fin
import Lib.Nat.Properties
import Lib.Reasoning
import Rhythm

import       Polymorphic.Temporal.Media
import Tiled.Polymorphic.Temporal.Media

import Csound.Base hiding (Loop, Duration)
import Csound.Sam  (Sample, wav, runSam)
import Csound.Typed.Types.Prim (Sig(..))

type Name     = String
type Volume   = Fin XVI
type BPM      = Integer
type Duration = Sig
type Stereo   = Mix (Sig, Sig)

data WavFile :: * where
  WavFile :: Name -> Volume -> WavFile

data BottomTsh :: Nat -> Nat -> * where
  Voice ::     Name -> Rhythm n d Volume
        ->          BottomTsh n d
  Sim   ::   BottomTsh n d -> BottomTsh n d
        ->          BottomTsh n d
  Seq   ::   BottomTsh n d -> BottomTsh m d
        ->        BottomTsh (n :+ m) d
  Loop  ::     SNat n -> BottomTsh m d
        ->         BottomTsh (n :* m) d

stepsBt :: BottomTsh n d -> SNat n
stepsBt (Voice   _ r) = stepsR r
stepsBt (Sim bt1 _  ) = stepsBt bt1
stepsBt (Seq bt1 bt2) = stepsBt bt1 %+ stepsBt bt2
stepsBt (Loop  n bt ) = n %* stepsBt bt

gridBt :: BottomTsh n d -> SNat d
gridBt (Voice   _ r) = gridR r
gridBt (Sim bt1 _  ) = gridBt bt1
gridBt (Seq bt1 _  ) = gridBt bt1
gridBt (Loop  _ bt ) = gridBt bt

eval :: BottomTsh n d -> Tile n d WavFile
eval (Voice name r) = fmap (WavFile name) (evalR r)
eval (Sim  bt1 bt2) = reset (eval bt1) % eval bt2
eval (Seq  bt1 bt2) = eval bt1 % eval bt2
eval (Loop   n bt ) = loop n bt
  where
    loop :: SNat n -> BottomTsh m d -> Tile (n :* m) d WavFile
    loop  O    bt   = noneT O (gridBt bt)
    loop (S n) bt   = eval bt % loop n bt

-- Smart constructors -------------------------------------

unitUpBt :: SNat u -> BottomTsh n d -> BottomTsh (u :* n) (u :* d)
unitUpBt u (Voice n r)   = Voice n (gridUpL u r)
unitUpBt u (Seq bt1 bt2) =
  let n1 = stepsBt bt1
      n2 = stepsBt bt2
  in  multComm u (n1 %+ n2)
  %|  multDistribPlus n1 n2 u
  %|  multComm n1 u
  %|  multComm n2 u
  %|  Seq (unitUpBt u bt1) (unitUpBt u bt2)
unitUpBt u (Sim bt1 bt2) =
      Sim (unitUpBt u bt1) (unitUpBt u bt1)
unitUpBt u (Loop m  bt ) =
  let n = stepsBt bt
  in  eqSym (multAssoc u m n)
  %|  multComm  u m
  %|  multAssoc m u n
  %|  Loop m (unitUpBt u bt)

-- Future work: LCM and Quotients.
sim :: ((d2 :* n1) ~ (d1 :* n2))
    => BottomTsh n1 d1 -> BottomTsh n2 d2 -> BottomTsh (d1 :* n2) (d1 :* d2)
sim bt1 bt2 =
  let g1 = gridBt bt1
      g2 = gridBt bt2
  in  multComm g1 g2
  %|  Sim (unitUpBt g2 bt1) (unitUpBt g1 bt2)

seq :: BottomTsh n1 d1 -> BottomTsh n2 d2 -> BottomTsh (d2 :* n1 :+ d1 :* n2) (d1 :* d2)
seq bt1 bt2 =
  let g1 = gridBt bt1
      g2 = gridBt bt2
  in  multComm g1 g2
  %|  Seq (unitUpBt g2 bt1) (unitUpBt g1 bt2)

-- Rendering ----------------------------------------------

class Number n where
  n2i :: Num i => n -> i

instance Number Nat where
  n2i  Zero   = 0
  n2i (Suc n) = n2i n + 1

instance Number (SNat n) where
  n2i  O    = 0
  n2i (S n) = n2i n + 1

instance Number (Fin n) where
  n2i = n2i . fin2nat

signal :: Number i => i -> Sig
signal = PrimSig . fromIntegral . n2i

bpm :: BPM -> Sig
bpm = PrimSig . ((/)(60*4)) . fromIntegral

runStereoScore :: Sample (Sig, Sig) -> Track Sig D -> Sco Stereo
runStereoScore = sco . const . runSam 60

stereoWavSample :: Duration -> Name -> Volume -> Sco Stereo
stereoWavSample d f v =
  eff (return . (mul (signal v))) $
  str d $ runStereoScore (wav $ "./samples/" ++ f ++ ".wav") (temp 1)

runTile :: Tile n d WavFile -> Sco Stereo
runTile (Tile _ d m) = runMedia (signal d) m

runMedia :: Duration -> Media n WavFile -> Sco Stereo
runMedia d (None n  ) = str (signal n / d) (rest 1)
runMedia d (Some n (WavFile name vol)) = stereoWavSample (signal n / d) name vol
runMedia d (m1 :+: m2) = mel [runMedia d m1, runMedia d m2]
runMedia d (m1 :=: m2) = har [runMedia d m1, runMedia d m2]

runGroove :: (d ~ Suc m) => BPM -> BottomTsh n d -> IO ()
runGroove b = dac . mix . str (bpm b) . runTile . eval

-- Convinient values (first 16 Nats as Volumes) -----------

fz, fi, fii, fiii, fiv, fv, fvi, fvii       :: Volume
fviii, fix, fx, fxi, fxii, fxiii, fxiv, fxv :: Volume
fz    = FZero xv
fi    = FSuc $ FZero xiv
fii   = FSuc $ FSuc $ FZero xiii
fiii  = FSuc $ FSuc $ FSuc $ FZero xii
fiv   = FSuc $ FSuc $ FSuc $ FSuc $ FZero xi
fv    = FSuc $ FSuc $ FSuc $ FSuc $ FSuc $ FZero x
fvi   = FSuc $ FSuc $ FSuc $ FSuc $ FSuc $ FSuc $ FZero ix
fvii  = FSuc $ FSuc $ FSuc $ FSuc $ FSuc $ FSuc $ FSuc $ FZero viii
fviii = FSuc $ FSuc $ FSuc $ FSuc $ FSuc $ FSuc $ FSuc $ FSuc $
        FZero vii
fix   = FSuc $ FSuc $ FSuc $ FSuc $ FSuc $ FSuc $ FSuc $ FSuc $
        FSuc $ FZero vi
fx    = FSuc $ FSuc $ FSuc $ FSuc $ FSuc $ FSuc $ FSuc $ FSuc $
        FSuc $ FSuc $ FZero v
fxi   = FSuc $ FSuc $ FSuc $ FSuc $ FSuc $ FSuc $ FSuc $ FSuc $
        FSuc $ FSuc $ FSuc $ FZero iv
fxii  = FSuc $ FSuc $ FSuc $ FSuc $ FSuc $ FSuc $ FSuc $ FSuc $
        FSuc $ FSuc $ FSuc $ FSuc $ FZero iii
fxiii = FSuc $ FSuc $ FSuc $ FSuc $ FSuc $ FSuc $ FSuc $ FSuc $
        FSuc $ FSuc $ FSuc $ FSuc $ FSuc $ FZero ii
fxiv  = FSuc $ FSuc $ FSuc $ FSuc $ FSuc $ FSuc $ FSuc $ FSuc $
        FSuc $ FSuc $ FSuc $ FSuc $ FSuc $ FSuc $ FZero i
fxv   = FSuc $ FSuc $ FSuc $ FSuc $ FSuc $ FSuc $ FSuc $ FSuc $
        FSuc $ FSuc $ FSuc $ FSuc $ FSuc $ FSuc $ FSuc $ FZero O

toVolume :: Char -> Volume
toVolume '0' = fz
toVolume '1' = fi
toVolume '2' = fii
toVolume '3' = fiii
toVolume '4' = fiv
toVolume '5' = fv
toVolume '6' = fvi
toVolume '7' = fvii
toVolume '8' = fviii
toVolume '9' = fix
toVolume 'a' = fx
toVolume 'b' = fxi
toVolume 'c' = fxii
toVolume 'd' = fxiii
toVolume 'e' = fxiv
toVolume 'f' = fxv
toVolume  c  = error ("invalid volume '" ++ return c ++ "'")

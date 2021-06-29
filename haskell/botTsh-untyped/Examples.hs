{-# LANGUAGE
    DeriveFunctor
  , OverloadedStrings
  , FlexibleContexts
  , TypeFamilies
  , QuasiQuotes
#-}

module Examples where

import Csound.Base ( Sig, Sig2, Sco, Mix, D, Track
                   , eff, mul, mix, dac
                   , str, loopBy
                   , cave )
import BotTsh
import Units
import CSound.SFX
import CSound.Noises hiding (rest)
import CSound.Audible
import CSound.RenderTPTM

import       Polymorphic.Temporal.Media
import Tiled.Polymorphic.Temporal.Media

qn, en, sn, qu :: Duration
qn = (1 % 4) ; en = (1 % 8) ; sn = (1 % 16); qu = (1 % 20)

pp, p, mf, f, ff :: Volume
pp = 0.1; p = 0.3; mf = 0.5; f = 0.7 ; ff = 1

hh :: Volume -> Duration -> Media Audio
hh v d = Prim (Sound (stereoWavSample "hhc", v, []) d)

sd :: Volume -> Duration -> Media Audio
sd v d = Prim (Sound (stereoWavSample "sd", v, []) d)

bd :: Volume -> Duration -> Media Audio
bd v d = Prim (Sound (stereoWavSample "bd", v, []) d)

rest :: Duration -> Media Audio
rest = Prim . Silence

-- Dilla feel.
-- dillalude =
--  (foldl1 (:+:) $ take 4 $ repeat $
--    (hh f (3*qu) :+: hh mf (2*qu)) :=: (rest en :+: hh mf en))
--   :=: (rest (qn + en + sn) :+: hh mf en :+: hh mf en :+: rest (qn + sn))
--   :=: (none  qn :+: sd f  qn :+: none  qn :+: sd f qn)
--   :=: (bd f  qn :+: none  (qn + en) :+: bd f  qn :+: none en)
-- main1 = dac $ mix $ loopBy 2 $ runPTM 80 $ dillalude

-- Example for report (pocket).
-- hihat = Tile 0 1 $ hh mf en :+: hh mf en :+: hh mf en :+: hh mf en :+:
--         hh mf en :+: hh mf en :+: hh mf en :+: hh mf en
-- snare = delayM (1 % 200) $ Tile 0 1 $ none qn :+: sd f qn :+: none qn :+: (sfx (cave 0.2) $ sd f qn)
-- kick  = delayM (-1 * (1 % 264)) $ Tile 0 1 $ bd f qn :+: none qn :+: bd f qn :+: none qn
-- main1  = dac $ mix $ loopBy 2 $ runTPTM 120 $  hihat %% (inverse snare) %% kick

part1 = -- Straight hip hop beat.
  [botTsh|
       loop 2 :
         hhc <- (2,2,4) { f788  f788  f788  f788 },
         hho <- (2,2,4) { ....  ....  ....  ...a },
         sd  <- (2,2  ) { .     f     .     f    },
         bd  <- (2,2,2) { f.    .8    .f    .8   }
   |]
part2 = -- Brazillian sixteenths.
  [botTsh|
       loop 2 :
         hhc <- ((2,2,4){f7} (2,2,4) <3,256= {8} x 2) x4,
         hho <-  (2,2,4)         { ....  ....  ....  ...a },
         sd  <-  (2,2  ) =1,256> { .     f     .     f    },
         bd  <-  (2,2,2) <1,256= { f.    .8    .f    .8   }
   |]
part3 = -- The straight quintuplet shuffle.
  [botTsh|
       loop 2 :
         hhc  <- [3 2](2,2,4) { f8 } x 8,
         hho  <-      (2,2,4) { ....  ....  ....  ...a },
         sd   <-      (2,2  ) { .     f     .     f    },
         bd   <-      (2,2,2) { f .   . 8   . f   . 8  }
   |]
part4 = -- Metric modulation
  [botTsh|
       loop 2 :
         hhc  <- [3 2](1,3,4) { f8 } x 8,
         hho  <-      (1,3,4) { ....  ....  ....  ...a },
         sd   <-      (1,3  ) { .     f     .     f    },
         bd   <-      (1,3,2) { f .   . .   . f   . .  }
   |]
examples =
  [botTsh|
       loop 4 :
         $part1;
         $part2;
         $part3;
         $part4
   |]

test =
  [botTsh|
         hhc  <- (2,2,2) { f8 } x 4    ,
         sd   <- (2,2) <1,16= { .f.f } ,
         bd   <- (2,2,2)      { f... .f.. } ;

         hhc  <- (2,2,2) { f8 } x 4    ,
         bd   <- (2,2,2)      { f... .f.. } ,
         sd   <- (2,2) <1,16= { .f.f } ;

         sd   <- (2,2) <1,16= { .f.f } ,
         hhc  <- (2,2,2) { f8 } x 4    ,
         bd   <- (2,2,2)      { f... .f.. } ;

         sd   <- (2,2) <1,16= { .f.f } ,
         bd   <- (2,2,2)      { f... .f.. } ,
         hhc  <- (2,2,2) { f8 } x 4    ;

         bd   <- (2,2,2)      { f... .f.. } ,
         hhc  <- (2,2,2) { f8 } x 4    ,
         sd   <- (2,2) <1,16= { .f.f } ;

         bd   <- (2,2,2)      { f... .f.. } ,
         sd   <- (2,2) <1,16= { .f.f } ,
         hhc  <- (2,2,2) { f8 } x 4
   |]

run  = dac . mix . runTPTM 90 . eval
main = run examples

-- Example for report.
-- Problem (sfx applied only locally.
hihat = hh mf en :+: hh mf en :+: hh mf en :+: hh mf en :+:
        hh mf en :+: hh mf en :+: hh mf en :+: hh mf en
snare = none  qn :+: sd f  qn :+: none  qn :+: (sfx (cave 0.2) $ sd f qn)
kick  = bd f  qn :+: none  qn :+: bd f  qn :+: none qn
main1 = dac $ mix $ loopBy 2 $ runPTM 120 $ hihat :=: snare :=: kick

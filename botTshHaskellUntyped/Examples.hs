{-# LANGUAGE
    DeriveFunctor
  , OverloadedStrings
  , FlexibleContexts
  , TypeFamilies
  , QuasiQuotes
#-}

module Examples where

import Csound.Base ( Sig, Sig2, Sco, Mix, D, Track           -- Basics.
                   , eff, mul, mix, dac                      -- Rendering
                   , sco, har, mel, rest, temp, str, loopBy  -- From Temporal.Media.
                   , cave                                    -- A line for fsx.
                   )

import BotTsh
import Units
import CSound.SFX
import CSound.Noises
import CSound.Audible
import CSound.RenderTPTM

import       Polymorphic.Temporal.Media
import Tiled.Polymorphic.Temporal.Media

qn, en, sn :: Duration
qn = (1 % 4) ; en = (1 % 8) ; sn = (1 % 16)

pp, p, mf, f, ff :: Volume
pp = 0.1; p = 0.3; mf = 0.5; f = 0.7 ; ff = 1

hh :: Volume -> Duration -> Media Audio
hh v d = Prim (Sound (stereoWavSample "hhc", v, []) d)

sd :: Volume -> Duration -> Media Audio
sd v d = Prim (Sound (stereoWavSample "sd", v, []) d)

bd :: Volume -> Duration -> Media Audio
bd v d = Prim (Sound (stereoWavSample "bd", v, []) d)

-- Example for report.
-- Problem (sfx applied only locally.
-- hihat = hh mf en :+: hh mf en :+: hh mf en :+: hh mf en :+:
--         hh mf en :+: hh mf en :+: hh mf en :+: hh mf en
-- snare = none  qn :+: sd f  qn :+: none  qn :+: (sfx (cave 0.2) $ sd f qn)
-- kick  = bd f  qn :+: none  qn :+: bd f  qn :+: none qn
-- main1 = dac $ mix $ loopBy 2 $ runPTM 120 $ hihat :=: snare :=: kick

-- Example for report (pocket).
-- hihat = Tile 0 1 $ hh mf en :+: hh mf en :+: hh mf en :+: hh mf en :+:
--         hh mf en :+: hh mf en :+: hh mf en :+: hh mf en
-- snare = delayM (1 % 200) $ Tile 0 1 $ none qn :+: sd f qn :+: none qn :+: (sfx (cave 0.2) $ sd f qn)
-- kick  = delayM (-1 * (1 % 264)) $ Tile 0 1 $ bd f qn :+: none qn :+: bd f qn :+: none qn
-- main1  = dac $ mix $ loopBy 2 $ runTPTM 120 $  hihat %% (inverse snare) %% kick

part1 :: BotTsh Event -- Straight hip hop beat.
part1 =
  [botTsh|
       loop 2 :
         hhc <- (2,2,4) { f788  f788  f788  f788 },
         hho <- (2,2,4) { ....  ....  ....  ...a },
         sd  <- (2,2  ) { .     f     .     f    },
         bd  <- (2,2,2) { f.    .8    .f    .8   }
   |]
part2 :: BotTsh Event -- Brazillian sixteenths.
part2 =
  [botTsh|
       loop 2 :
         hhc <- ((2,2,4){f7} (2,2,4) <3,256= {8} x 2) x4,
         hho <-  (2,2,4)         { ....  ....  ....  ...a },
         sd  <-  (2,2  ) =1,256> { .     f     .     f    },
         bd  <-  (2,2,2) <1,256= { f.    .8    .f    .8   }
   |]
part3 :: BotTsh Event -- The straight quintuplet shuffle.
part3 =
  [botTsh|
       loop 2 :
         hhc  <- [3 2](2,2,4) { f8 } x 8,
         hho  <-      (2,2,4) { ....  ....  ....  ...a },
         sd   <-      (2,2  ) { .     f     .     f    },
         bd   <-      (2,2,2) { f .   . 8   . f   . 8  }
   |]
part4 :: BotTsh Event -- Metric modulation
part4 =
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
       loop 4 :
       bd  <- (2) {a},
       hhc <- (2,2,2) {.f} (2,2,2)=1,8>{a8} |]

-- To show that it is possible to extract a signal, and put an effect on it.
-- verbSnare :: [(Sig, Sig)]
-- verbSnare = map (\(n, t) -> if n == "sd" then cave 0.2 t else t) $
--   map (\(n, t) -> (n, mix $ runTPTM 105 $ eval $ t)) $ tracks examples

main = dac $ cave 0.026 $ mix $ runTPTM 90 $ eval $ examples


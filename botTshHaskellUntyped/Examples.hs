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

main = dac $ cave 0.026 $ mix $ runTPTM 90 $ eval $ examples


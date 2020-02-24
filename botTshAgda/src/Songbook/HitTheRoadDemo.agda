
module Songbook.HitTheRoadDemo where

open import BottomTsh

guit = playback 4 "cymantics/guit140d#min" c'_
buzz = playback 4 "cymantics/vinyl"        c'_
back = guit ، buzz

-- groove = todo

demo =
  buzz ;
  back

main = runGroove 140 demo

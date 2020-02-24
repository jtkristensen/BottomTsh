
module Songbook.MobDemo where

open import BottomTsh

mob = playback 4 "cymantics/mob128" c'_

groove : ⊥'tsh 4800 2400
groove =
  voice "808/hhc/3"  begin
    repeat 8 (⟦ 8 ∥ b' 7' ⟧)
  end ،
  voice "808/perc/5" begin
    repeat 4 (⟦ph 2 ∷ 3 ∷ 4 ∷ 3 ∷ [] ⸲ 8 ∥ 7' 9' 8' 6' ⟧)
  end ،
  voice "808/sd/3"   begin
    ⇐ 1 / 300 ⇐ repeat 2 (⟦ 8 ∥ o o f' 8' 1' - f' - ⟧)
  end ،
  voice "808/bd/2" begin
    ⇒ 1 / 150 ⇒ ( ⟦  8 ∥ f'   -   2'   -    2'   a'  o    8'   ⟧ ⸲
                  ⟦ 16 ∥ f' - - - 2' - - -  f' - - - 1' - - 2' ⟧ )
  end

demo : ⊥'tsh 52800 2400
demo =
  loop 2 (loop 2 (mob ، (loop 2 groove)) ; groove) ;
  playback 2 "808/glass" f'_ ،
  playback 2 "808/bd/2"  d'_

main = runGroove 128 demo


-- Contributed by Jeppe Ram Pedersen after 45 minutes of training.
-- Jeppe is a first year computer science student with a msc degree in musicology.

module Songbook.Jeppe where

open import BottomTsh

backing = playback 8 "cymantics/piano140Amin" c'_

demo =
  voice "hhc" begin
    ⟦ 16 ∥ o o o 3' o o o 3' o 3' o 3' o 5' 6' 7' ⟧ ⸲
    ⟦ 16 ∥ o o o 3' o o o 3' 3' 3' 4' 4' 4' 5' 6' 7' ⟧
  end ،
  voice "sd" begin
    ⇒ 1 / 128 ⇒ repeat 4 (⟦ 4 ∥ o 9' ⟧)
  end ،
  voice "bd" begin
    repeat 2 (⟦ph 3 ∷ 3 ∷ 2 ∷ [] ∥  3 ∥  a' a' a' ⟧)
  end

main = runGroove 140 (repeat 8 (backing ، (repeat 4 demo)))

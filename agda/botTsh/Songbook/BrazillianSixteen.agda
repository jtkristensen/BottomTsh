
module Songbook.BrazillianSixteen where

open import BottomTsh

-- Brazillian man's Hip Hop {~_^}.
hihat = ⟦ 16 ∥ f' 7' ⟧ ⸲ ⇐ 1 / 64 ⇐ ⟦ 16 ∥ a' 8' ⟧
snare = ⟦ 4  ∥ o f' o f' ⟧
kick  = ⟦ 8  ∥ f' o  o  f' o  o  o  f' ⟧ ⸲
        ⟦ 8  ∥ o  f' o  o  f' o  f' o  ⟧
beat  =
  voice "hhc" begin
    repeat 8 hihat
  end ،
  voice "sd" begin
    ⇒ 1 / 300 ⇒ repeat 2 snare
  end ،
  voice "bd" begin
    ⇐ 1 / 256 ⇐ kick
  end

main = runGroove 105 (repeat 4 beat)

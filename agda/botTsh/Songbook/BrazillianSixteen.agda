
module Songbook.BrazillianSixteen where

open import BottomTsh

hihat = ⟦ 16 ∥ f' 7' ⟧ ⸲ ⇐ 1 / 128 ⇐ ⟦ 16 ∥ a' 8' ⟧
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
    ⇐ 1 / 250 ⇐ kick
  end

main = runGroove 105 (repeat 4 beat)

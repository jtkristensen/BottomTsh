
module Songbook.Figure10 where

open import BottomTsh

shuffle-example =
  voice "hhc" begin
    repeat 4 (⟦ph 3 ∷ 2 ∷ [] ⸲ 8 ∥ f' 8' ⟧)
  end ،
  voice "hhc" begin
    ⟦ 16 ∥ o o 8' o o o 8' 6' o 6' 8' o o o 8' o ⟧
  end ،
  voice "sd" begin
    ⇒ 1 / 240 ⇒ ⟦ 4 ∥ o f' o f' ⟧
  end ،
  voice "bd" begin
    ⇐ 1 / 160 ⇐ ⟦ 4 ∥ f' o ⟧ ⸲ ⟦ 8 ∥ o f' ⟧ ⸲ ⟦ 4 ∥ o ⟧
  end

main = runGroove 80 (loop 12 shuffle-example)

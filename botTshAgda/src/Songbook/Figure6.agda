
module Songbook.Figure6 where

open import BottomTsh

Figure6 =
  signature 4 4 ،
  voice "808/perc/5" begin
    repeat 4 (⟦ph 4 ∷ 3 ∷ 3 ∷ [] ∥ 12 ∥ a' 8' a' ⟧)
  end ،
  voice "808/perc/1" begin
    ⟦ph 4 ∷ 4 ∷ 5 ∷ 3 ∷ 5 ∷ [] ∥ 5 ∥ a' a' a' e' f' ⟧
  end ،
  voice "808/bd/1" begin
    ⇐ 1 / 16 ⇐ repeat 2 (⟦ 4 ∥ o ⟧ ⸲ ⟦ph 3 ∷ 1 ∷ [] ∥ 8 ∥ e' d' ⟧)
  end ،
  voice "808/hhc/2" begin
    repeat 4 (⟦ph 3 ∷ 2 ∷ [] ∥ 8 ∥ f' 8' ⟧)
  end ،
  voice "808/sd/4" begin
    repeat 2 (⟦ 4 ∥ o 9' ⟧)
  end

main = runGroove 94 (repeat 4 Figure6)

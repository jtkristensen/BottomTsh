
module Songbook.Figure14 where

open import BottomTsh

main = runGroove 90 (
  voice "hhc" begin
    repeat 4 (⟦ph 2 ∷ 1 ∷ [] ⸲ 8 ∥ f' 8' ⟧)
  end ،
  voice "sd" begin
    repeat 2 (⟦ph 2 ∷ 1 ∷ 2 ∷ 1 ∷ [] ⸲ 8 ∥ o o f' - ⟧)
  end ،
  voice "bd" begin
    ⟦ph 2 ∷ 1 ∷ 2 ∷ 1 ∷ 2 ∷ 1 ∷ 2 ∷ 1 ∷ [] ⸲ 8 ∥ f' - o o o f' - o ⟧
  end
  )

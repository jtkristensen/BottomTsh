
module Songbook.Phrasing where

open import BottomTsh

straight = 10 ∷ 10 ∷ []
shuffled = 12 ∷  8 ∷ []
swung    = 16 ∷  4 ∷ []

rock1 : NatList 2 20 → ⊥'tsh 160 160
rock1 phrasing =
  voice "hhc" begin
    repeat 4 (⟦ph phrasing ∥ 8 ∥ f' 8' ⟧)
  end ،
  voice "hhc" begin
    ⟦ 16 ∥ o o 8' o o o 8' o o o 8' o o o 8' o ⟧
  end ،
  voice "sd" begin
    repeat 2 (⟦ 4 ∥ o f' ⟧)
  end ،
  voice "bd" begin
    ⟦ 8 ∥ f' o o o o f' o o ⟧
  end

main = runGroove 80 (repeat 4 (rock1 straight ; rock1 shuffled ; rock1 swung))

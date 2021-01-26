
module Songbook.Shuffle where

open import BottomTsh

straight = 10 ∷ 10 ∷ []
shuffle  = 12 ∷  8 ∷ []
swing    = 15 ∷  5 ∷ []

rock1 : NatList 2 20 → ⊥'tsh 320 160
rock1 phrasing =
  repeat 2 (
  voice "hhc" begin
    repeat 4 (⟦ph phrasing ∥ 8 ∥ f' 8' ⟧)
  end ،
  voice "sd" begin
    ⟦ 4 ∥ o f' o f' ⟧
  end ،
  voice "bd" begin
    ⟦ 8 ∥ f' o o o o f' o o ⟧
  end)

main = runGroove 105 (repeat 4 (rock1 straight ; rock1 shuffle ; rock1 swing))


module Songbook.Dilla where

open import BottomTsh

--
rock1 =
  signature 4 4 ،
  voice "hhc" begin
    repeat 4 (⟦ph 3 ∷ 2 ∷ [] ∥ 8 ∥ f' 8' ⟧)
  end ،
  voice "hhc" begin
    ⟦ 16 ∥ o o 8' o o o 8' 6' o 6' 8' o o o 8' o ⟧
  end ،
  voice "sd" begin
    ⟦ 4 ∥ o f' o f' ⟧
  end ،
  voice "bd" begin
    ⟦ (4 * 2) ∥ f' - - o o f' - - ⟧
  end

main = runGroove 80 (repeat 4 rock1)

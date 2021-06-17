
-- A most basic of drum grooves.
module Songbook.Rock1 where

open import BottomTsh

rock1 =
  voice "hhc" begin
    repeat 4 (⟦ 8 ∥ f' 8' ⟧)
  end ،
  voice "sd" begin
    repeat 2 (⟦ 4 ∥ o f' ⟧)
  end ،
  voice "bd" begin
    repeat 2 (⟦ 4 ∥ f' o ⟧)
  end

rock1' =
  voice "hhc" begin
    repeat 4 (⟦ 8 ∥ f' 8' ⟧)
  end ،
  voice "sd" begin
    repeat 2 (⟦ 4 ∥ o f' ⟧)
  end ،
  voice "bd" begin
    ⟦ 4 ∥ f' o ⟧ ⸲ ⟦ 8 ∥ o f' ⟧ ⸲ ⟦ 4 ∥ o ⟧
  end

main = runGroove 120 (repeat 120 rock1')

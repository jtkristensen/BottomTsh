
module Songbook.Figure8 where

open import BottomTsh

left-pattern =
  voice "sd" begin
    ⟦ 4 ∥ f' - - f' - f' - - f' - - - ⟧
  end

right-pattern =
  voice "sd" begin
    ⟦ 16 ∥ f' - - f' - f' - - ⟧ ⸲
    ⟦  4 ∥ f' ⟧
  end

main = runGroove 480 left-pattern
-- main = runGroove 120 right-pattern

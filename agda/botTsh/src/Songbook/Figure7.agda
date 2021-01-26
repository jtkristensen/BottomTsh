
module Songbook.Figure7 where

open import BottomTsh

main = runGroove 90 (
  voice "sd" begin
    ⟦ (2 ⸴ 2 ⸴ 2) ∥ f' - - ⟧ ⸲
    ⟦ (2 ⸴ 2 ⸴ 3) ∥ f' - - f' ⟧ ⸲
    ⟦ (2 ⸴ 3 ⸴ 3) ∥ - f' f' ⟧ ⸲
    ⟦ (2 ⸴ 2 ⸴ 2) ∥ - ⟧
  end
  )


module Songbook.Figure6 where

open import BottomTsh

main = runGroove 90
  (
  voice "sd" begin
    ⟦ (1 ⸴            ) ∥ f' o ⟧ ⸲
    ⟦ (1 ⸴ 2          ) ∥ f' o ⟧ ⸲
    ⟦ (1 ⸴ 2 ⸴ 2       ) ∥ f' o ⟧ ⸲
    ⟦ (1 ⸴ 2 ⸴ 2 ⸴ 2   ) ∥ f' o ⟧ ⸲
    ⟦ (1 ⸴ 2 ⸴ 2 ⸴ 2 ⸴ 2) ∥ f' o ⟧
  end
  )

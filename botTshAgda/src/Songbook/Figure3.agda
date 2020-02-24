
module Songbook.Figure3 where

open import BottomTsh

Figure3 =
  voice "hhc" begin ⟦ 8 ∥ f' 8' f' 8' f' 8' f' 8' ⟧ end ،
  voice  "sd" begin ⇐ 1 / 16 ⇐ ⟦ 4 ∥ o  f' o  f'  ⟧ end ،
  voice  "bd" begin ⟦ 8 ∥ f' -  o  o  o f'  -  o  ⟧ end

main = runGroove 90 Figure3

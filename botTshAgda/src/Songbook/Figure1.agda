
module Songbook.Figure1 where

open import BottomTsh

Figure1 =
  voice "hhc" begin ⟦ 8 ∥ f' 8' f' 8' f' 8' f' 8' ⟧ end ،
  voice  "sd" begin ⟦ 4 ∥ o     f'    o     f'    ⟧ end ،
  voice  "bd" begin ⟦ 8 ∥ f' -  o  o  o f'  -  o  ⟧ end

main = runGroove 90 Figure1


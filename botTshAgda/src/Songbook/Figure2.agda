
module Songbook.Figure2 where

open import BottomTsh

Figure2 =
  voice "hhc" begin repeat 4 (⟦ph 3 ∷ 2 ∷ [] ⸲ 8 ∥ f' 8' ⟧) end ،
  voice  "sd" begin ⟦ 4 ∥ o     f'    o     f'    ⟧ end ،
  voice  "bd" begin ⟦ 8 ∥ f' -  o  o  o f'  -  o  ⟧ end

main = runGroove 90 Figure2


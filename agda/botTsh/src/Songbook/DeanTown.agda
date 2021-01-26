
module Songbook.DeanTown where

open import BottomTsh

top =
  voice "hhc" begin
    repeat 4 (⟦ph 3 ∷ 3 ∷ 3 ∷ 2 ∷ [] ∥ 16 ∥ a' 8' 3' o ⟧)
  end ،
  voice "hho" begin
    repeat 4 (⟦ 16 ∥ o o 9' - ⟧)
  end ،
  voice "sd" begin
    repeat 2 (⟦ 4 ∥ o f' ⟧)
  end

rest = voice "808/bd/5" begin ⟦ 1 ∥ f' ⟧ end

beat =
  top ،
  voice "808/bd/5" begin
    repeat 4 (⟦ 4 ∥ f' ⟧)
  end

fill =
  (top ; top) ،
  voice "808/bd/5" begin
    ⟦ 16 ∥ f' - - - f' - - - f' - - - f' - f' - ⟧ ⸲
    ⟦ 16 ∥ - - f' - - f' - - f' - - - f' - -  - ⟧
  end

intro : ⊥'tsh 1408 176
intro = repeat 8 beat

form =
  repeat 2 rest ;
  repeat 6 beat ;
  fill ;
  repeat 6 beat

main = runGroove 92 (intro ; (repeat 2 form))

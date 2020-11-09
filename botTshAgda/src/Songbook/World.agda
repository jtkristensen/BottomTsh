
module Songbook.World where

open import BottomTsh

gnawa =
  voice "808/perc/5" begin
    repeat 4 (⟦ph 4 ∷ 3 ∷ 3 ∷ [] ∥ 12 ∥ a' 8' a' ⟧)
  end

son-clave =
  voice "808/perc/1" begin
    ⟦ph 4 ∷ 4 ∷ 5 ∷ 3 ∷ 5 ∷ [] ∥ 5 ∥ a' a' a' e' f' ⟧
  end

pulse =
  voice "808/bd/1" begin
    ⇐ 1 / 16 ⇐ repeat 2 (⟦ 4 ∥ o ⟧ ⸲ ⟦ph 3 ∷ 1 ∷ [] ∥ 8 ∥ e' d' ⟧)
  end

shuffle =
  voice "808/hhc/2" begin
    repeat 4 (⟦ph 3 ∷ 2 ∷ [] ∥ 8 ∥ f' 8' ⟧)
  end

back-beat =
  voice "808/sd/4" begin
    ⇒ 1 / 128 ⇒ repeat 2 (⟦ 4 ∥ o 9' ⟧)
  end

groove =
  repeat 4 gnawa ;
  repeat 4 (gnawa ، son-clave) ;
  repeat 4 (gnawa ، son-clave ، pulse) ;
  repeat 4 (gnawa ، son-clave ، pulse ، shuffle) ;
  repeat 8 (gnawa ، son-clave ، pulse ، shuffle ، back-beat)

main = runGroove 94 (groove)

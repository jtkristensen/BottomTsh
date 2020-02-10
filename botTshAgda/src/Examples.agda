module Examples where

open import BotTsh

snare =
  voice "sd" begin
     repeat 2 (⟦ 4 ∥ o f' ⟧)
  end

kick =
  voice "bd" begin
    ⟦ 2 ∥ f' ⟧ ⸲ ⟦ 8 ∥ o f' - - ⟧
  end

straight-hat =
  voice "hhc" begin
    repeat 4 (⟦ 16 ∥ f' 7' 8' 8' ⟧)
  end ، kick ، snare

brazillian-hat =
  voice "hhc" begin
    repeat 4 (⟦ 16 ∥ f' 7' ⟧ ⸲ ⇐ 1 / 40 ⇐ ⟦ 16 ∥ 8' 8' ⟧)
  end ، kick ، snare

shuffled-hat =
  voice "hhc" begin
    repeat 4 (⟦ph 3 ∷ 2 ∷ 3 ∷ 2 ∷ [] ⸲ 16 ∥ f' 7' 8' 8' ⟧)
  end ، kick ، snare

examples =
  loop 2 straight-hat ;
  loop 2 brazillian-hat ;
  loop 2 shuffled-hat

main = runGroove 90 (loop 4 examples)

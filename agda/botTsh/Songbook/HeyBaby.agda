
-- A transcription of the drum part for 'Hey Baby' by 'No Doubt'.

module Songbook.HeyBaby where

open import BottomTsh

sd-pattern : Name → ⊥'tsh 128 128
sd-pattern v =
  voice v begin
    ⇐ 1 / 128 ⇐ ⟦ 16 ∥ o - - - - - a' - - o - a' - - a' - ⟧
  end

bd-slack = ⟦ph 3 ∷ 1 ∷ [] ∥ 8 ∥ e' d' ⟧

verse =
  voice "hhc" begin
    repeat 2 (⟦ 8 ∥ a' 8' ⟧ ⸲ ⟦ 16 ∥ 8' 6' 7' o ⟧)
  end ، sd-pattern "sd" ، sd-pattern "808/sd/8" ،
  voice "808/bd/2" begin
    bd-slack ⸲ ⟦ 4 ∥ o f' o ⟧
  end

shaker     =
  voice "808/perc/5" begin
    repeat 2 (⟦ 16 ∥ f' 8' f' 8' f' d' o - ⟧)
  end

bridge = verse ، shaker

break =
  voice "808/bd/2" begin
    bd-slack ⸲ ⟦ 4 ∥ o o o ⟧
  end

chorus =
  voice "hhc" begin
    repeat 4 (⟦ 16 ∥ a' 6' ⟧) ⸲
    ⟦ 32 ∥ a' 4' 6' 4' ⟧ ⸲
    repeat 3 (⟦ 16 ∥ 9' 5' ⟧)
  end ،
  shaker ،
  sd-pattern "808/sd/4" ،
  voice "808/bd/2"  begin
    bd-slack ⸲ ⟦ 4 ∥ o f' o ⟧
  end

c-section =
  voice "hhc" begin
    repeat 2 (⟦ 16 ∥ f' - o - ⟧ ⸲ ⇐ 1 / 128 ⇐ ⟦ 16 ∥ f' 8' o - ⟧)
  end ،
  voice "hho" begin
    repeat 2 (⟦ 8 ∥ o d' - a' ⟧)
  end ،
  voice "808/sd/4"  begin
    ⇐ 1 / 128 ⇐ (⇒ 1 / 8 ⇒ repeat 2 (⟦ 4 ∥ o f' ⟧))
  end ،
  voice "808/bd/2"  begin
    ⇒ 1 / 256 ⇒ repeat 4 (⟦ 16 ∥ d' - - 9' ⟧)
  end

ending =
  playback 2 "808/glass" f'_ ،
  playback 2 "808/bd/2"  d'_

song =
  repeat  8 verse     ;
  repeat  4 bridge    ;
  break             ;
  repeat  8 chorus    ;
  repeat  2 break     ;
  repeat  4 verse     ;
  repeat  4 bridge    ;
  break             ;
  repeat  8 chorus    ;
  repeat  4 c-section ;
  repeat  4 break     ;
  repeat  4 bridge    ;
  repeat  2 break     ;
  repeat 16 chorus    ;
  ending

main = runGroove 87 song

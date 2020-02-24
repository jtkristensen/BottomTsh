module Songbook.Figure4 where

open import BottomTsh
open import Songbook.Figure1 using (Figure1)
open import Songbook.Figure3 using (Figure3)

main = runGroove 90 (Figure3 ; Figure1)

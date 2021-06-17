
module Lib.Shuffle where

open import BottomTsh
open import Data.Nat
open import Rhythm renaming (none to noneR)

data Even : ℕ → Set where
  even : ∀ k → Even (k * 2)

-- shuffle3 : ∀ {A n} → {Even n} → (d : ℕ) → Pattern A n → Rhythm A n d
-- shuffle3 {_}{0}{even k} d p = {!!}

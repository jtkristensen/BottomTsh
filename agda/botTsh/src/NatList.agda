
module NatList where

import Data.Nat                              as Nat
import Data.Nat.Properties                   as NatProp
import Relation.Binary.PropositionalEquality as Eq

open import Lemmas
open Nat     using (ℕ; zero; suc; _+_ ; _*_)
open NatProp using ( +-comm ; *-comm ; +-assoc )
open Eq      using ( _≡_ ; refl ; sym )

infixr 4 _∷_
data NatList : (length sum : ℕ) → Set where
  []  : NatList 0 0
  _∷_ : {k m : ℕ}(n : ℕ) → NatList k m → NatList (suc k) (n + m)

stretchNL : {len sum : ℕ}(n : ℕ) → NatList len sum → NatList len (sum * n)
stretchNL n       []     =  []
stretchNL n (zero  ∷ xs) = 0 ∷ stretchNL n xs
stretchNL n (_∷_ {m = m} (suc x) xs)
  rewrite *-distrib-+ x m n
        | sym (+-assoc n (x * n) (m * n))
        | *-comm x n
        | +-comm n (n * x)
        | *suc n x
        = (n * suc x) ∷ stretchNL n xs

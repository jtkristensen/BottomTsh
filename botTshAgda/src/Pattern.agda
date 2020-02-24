module Pattern where

import Data.Nat                              as Nat
import Data.Nat.Properties                   as NatProp
import Relation.Binary.PropositionalEquality as Eq
import Polymorphic.Temporal.Media            as PTM

open PTM     using ( Media ; _:+:_ ; _:-:_ )
             renaming ( none to nonePTM
                      ; some to somePTM )
open Nat     using (ℕ; zero; suc; _+_ ; _*_)
open NatProp using ( +-comm ; *-comm ; +-assoc )
open Eq      using ( _≡_ ; refl ; sym )

open import Lemmas
open import NatList

data Pattern (A : Set) : ℕ → Set where
  ⟨_⟩_ : {n : ℕ} → A → Pattern A n → Pattern A (suc n) -- event
  o_   : {n : ℕ}     → Pattern A n → Pattern A (suc n) -- abyss
  -_   : {n : ℕ}     → Pattern A n → Pattern A (suc n) -- annex
  ⟧    :               Pattern A 0                     -- empty

appendP : {A : Set}{n m : ℕ} → Pattern A n → Pattern A m → Pattern A (n + m)
appendP  ⟧          p₂ = p₂
appendP (⟨ a ⟩  p₁) p₂ = ⟨ a ⟩ (appendP p₁ p₂)
appendP (  o    p₁) p₂ = o     (appendP p₁ p₂)
appendP (  -    p₁) p₂ = -     (appendP p₁ p₂)

-pattern : {A : Set}(n : ℕ) → Pattern A n
-pattern zero    = ⟧
-pattern (suc n) = - (-pattern n)

none : {A : Set} → (n : ℕ) → Pattern A n
none zero    = ⟧
none (suc n) = appendP (o ⟧) (-pattern n)

expand : {A : Set}{n : ℕ}(m : ℕ) → Pattern A n → Pattern A (n + m)
expand m p = appendP p (-pattern m)

private
  stretch' : {A : Set}{n : ℕ}(m : ℕ) → Pattern A n → Pattern A (n * m)
  stretch' (suc m)  ⟧        = ⟧
  stretch' (suc m) (⟨ a ⟩ p) = ⟨ a ⟩ (appendP (-pattern m) (stretch' (suc m) p))
  stretch' (suc m) (  o   p) =   o   (appendP (-pattern m) (stretch' (suc m) p))
  stretch' (suc m) (  -   p) =   -   (appendP (-pattern m) (stretch' (suc m) p))
  stretch' {n = n} 0 _ rewrite *-comm n 0 = ⟧

stretch : {A : Set}{n : ℕ}(m : ℕ) → Pattern A n → Pattern A (m * n)
stretch {n = n} m p rewrite *-comm m n = stretch' m p

phrase : {A : Set}{len sum : ℕ} → NatList len sum → Pattern A len → Pattern A sum
phrase []            ⟧        = ⟧
phrase (zero  ∷ xs) (⟨ a ⟩ p) = phrase xs p
phrase (zero  ∷ xs) (  o   p) = phrase xs p
phrase (zero  ∷ xs) (  -   p) = phrase xs p
phrase (suc n ∷ xs) (⟨ a ⟩ p) = appendP (expand n (⟨ a ⟩ ⟧)) (phrase xs p)
phrase (suc n ∷ xs) (  o   p) = appendP (expand n (  o   ⟧)) (phrase xs p)
phrase (suc n ∷ xs) (  -   p) = appendP (expand n (  -   ⟧)) (phrase xs p)

eval : {A : Set}{n : ℕ} → Pattern A n → Media A n
eval ⟧                   = nonePTM 0
eval (⟨_⟩_ a ⟧)          = somePTM 1 a
eval (⟨_⟩_ a (⟨ b ⟩ p))  = somePTM 1 a :+: eval (⟨ b ⟩ p)
eval (⟨_⟩_ a (o p))      = somePTM 1 a :+: eval (o p)
eval (⟨_⟩_ a (- p))      = somePTM 1 a :-: eval (- p)
eval (o_ ⟧)              = nonePTM 1
eval (o_ (⟨_⟩_ a p))     = nonePTM 1   :+: eval (⟨ a ⟩ p)
eval (o (o p))           = nonePTM 2   :+: eval p
eval (o (- p))           = nonePTM 1   :-: eval (- p)
eval (- ⟧)               = nonePTM 1
eval (- (⟨ a ⟩ p))       = nonePTM 1   :+: eval (⟨ a ⟩ p)
eval (-     (o p))       = nonePTM 1   :+: eval (o p)
eval (-     (- p))       = nonePTM 1   :-: eval (- p)

examplePattern : Pattern ℕ 12
examplePattern = o ⟨ 2 ⟩ - o - - o o  ⟨ 5 ⟩ o - - ⟧

exampleMedia : Media ℕ 12
exampleMedia = eval examplePattern

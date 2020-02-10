------------------------------------------
-- Library : Polymorphic.Temporal.Media --
------------------------------------------
-- Author  : Joachim                    --
------------------------------------------

module Polymorphic.Temporal.Media where

import Data.Nat                              as Nat
import Data.Nat.Properties                   as NatProp
import Data.Integer                          as Int
import Data.Empty                            as Void
import Relation.Nullary                      as Dec
import Relation.Binary.PropositionalEquality as Eq

open import Polymorphic.Temporal.Math
open Int     using (ℤ; ∣_∣; _-_; +_; _⊖_)
open Nat     using (ℕ; zero; suc; _+_; _*_; _≤_ ; s≤s ; z≤n ;_⊔_)
open NatProp using (_≤?_ ; ≤-pred ; suc-injective ; ≤-reflexive; ⊔-comm)
open Dec     using (yes ; no ; ¬_)
open Eq      using (_≡_ ; refl; sym; cong ; trans)
open Void    using ( ⊥-elim ; ⊥)

data Media (A : Set) : (dur : ℕ) → Set where
  none  : (n   : ℕ) →     Media A n
  some  : (n   : ℕ) → A → Media A n
  _:+:_ : {n m : ℕ} →     Media A n → Media A m → Media A (n + m)
  _:=:_ : {n   : ℕ} →     Media A n → Media A n → Media A n

map : ∀ {n} → {A B : Set} → (A → B) → Media A n → Media B n
map f (none  n  ) = none n
map f (some  n a) = some n (f a)
map f (m₁ :+: m₂) = map f m₁ :+: map f m₂
map f (m₁ :=: m₂) = map f m₁ :=: map f m₂

-- Stretch the duration of every element.
stretch : {A : Set}{n : ℕ} → (k : ℕ) → Media A n → Media A (n * k)
stretch k (none n  )          = none (n * k)
stretch k (some n a)          = some (n * k) a
stretch k (_:+:_ {d1} {d2} m1 m2)
  rewrite *-distrib-+ d1 d2 k  = stretch k m1 :+: stretch k m2
stretch k (m1 :=: m2)         = stretch k m1 :=: stretch k m2

-- Prepend/append silence.
delay : {A : Set}{m : ℕ}(n : ℤ) → Media A m → Media A (m + ∣ n ∣)
delay {_}{k} (ℤ.pos n) m
  rewrite +-comm k n = none n :+: m
delay (ℤ.negsuc n) m = m :+: none (suc n)

-- The shorter of two Media values, delayed to fit _:=:_
short : {A : Set}{dur₁ dur₂ : ℕ} → Media A dur₁ → Media A dur₂ → Media A (dur₁ ⊔ dur₂)
short {_}{d₁}{d₂} m₁ m₂
  with d₁ ≤? d₂
... | yes p
  rewrite
      trans (n≤m→n⊔m≡m p) (sym (n≤m→n⊔m≡n+[m-n] p))
    = m₁ :+: (none ∣ d₂ ⊖ d₁ ∣)
... | no ¬p
  rewrite
      ⊔-comm d₁ d₂
    | trans (n≤m→n⊔m≡m (¬n≤m→m≤n ¬p)) (sym (n≤m→n⊔m≡n+[m-n] (¬n≤m→m≤n ¬p)))
    = m₂ :+: none ∣ d₁ ⊖ d₂ ∣

-- The longer of two Media values, delayed to fit _:=:_
long : {A : Set}{dur₁ dur₂ : ℕ} → Media A dur₁ → Media A dur₂ → Media A (dur₁ ⊔ dur₂)
long {_}{d₁}{d₂} m₁ m₂
  with d₁ ≤? d₂
... | yes p rewrite n≤m→n⊔m≡m p = m₂
... | no ¬p rewrite ⊔-comm d₁ d₂ | n≤m→n⊔m≡m (¬n≤m→m≤n ¬p) = m₁

-- Interpretation of ` m₁ :=: m₂ ` where m₁ and m₂ start at the same time.
_⊨_ : {A : Set}{dur₁ dur₂ : ℕ} → Media A dur₁ → Media A dur₂ → Media A (dur₁ ⊔ dur₂)
m₁ ⊨  m₂ = short m₁ m₂ :=: long m₁ m₂
-- Interpretation of ` m₁ :+: m₂ ` that corresponds to the-tie-rule.
_:-:_ : {A : Set}{dur₁ dur₂ : ℕ} → Media A dur₁ → Media A dur₂ → Media A (dur₁ + dur₂)
none n₁     :-: none n₂    = none (n₁ + n₂)
none n₁     :-: some n₂ a  = none n₁ :+: some n₂ a
none n₁     :-: _:+:_ {n₂} {n₃} m₂ m₃
  rewrite sym (+-assoc n₁ n₂ n₃)
        = (none n₁ :-: m₂) :+: m₃
none n      :-: (m₂ :=: m₃) = (none n :-: m₂) :=: (none n :-: m₃)
some n₁ a   :-: none n₂     = some (n₁ + n₂) a
some n₁ a   :-: some n₂ b   = some n₁ a :+: some n₂ b
some n₁ a   :-: (_:+:_ {n₂} {n₃} m₂ m₃)
  rewrite sym (+-assoc n₁ n₂ n₃)
        = (some n₁ a :-: m₂) :+: m₃
some n a    :-: (m₂ :=: m₃) = (some n a :-: m₂) :=: (some n a :-: m₃)
_:-:_ {dur₂ = n₃} (_:+:_ {n₁} {n₂} m₁ m₂) m₃
  rewrite +-assoc n₁ n₂ n₃
        = m₁ :+: ( m₂ :-: m₃)
(m₁ :=: m₂) :-: m₃ = (m₁ :-: m₃) :=: (m₂ :-: m₃)

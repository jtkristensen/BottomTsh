module Songbook.ClappingMusic where

open import BottomTsh
open import Pattern                               using (appendP)
open import Relation.Binary.PropositionalEquality using (_≡_ ; refl)
open import Data.Nat.Properties                   using (+-comm)

-- Auxillary program:
lemma : ∀ n → suc n ≡ n + 1
lemma  zero                            = refl
lemma (suc n) rewrite +-comm (suc n) 1 = refl

rotatel : ∀ {n A} → Pattern A n → Pattern A n
rotatel {suc n} (⟨ x ⟩ p) rewrite lemma n = appendP p (⟨ x ⟩ ⟧)
rotatel {suc n} (o     p) rewrite lemma n = appendP p (  o   ⟧)
rotatel {suc n} (-     p) rewrite lemma n = appendP p (  -   ⟧)
rotatel ⟧                                 = ⟧

iter : ∀ n {m A} → Pattern A m → Pattern A (n * (m + m))
iter zero    _ = ⟧
iter (suc n) p = appendP (appendP p p) (iter n (rotatel p))

-- Actual composition:
basis = f' 8' 8' o f' 8' o f' o f' 8' o ⟧

left =
  voice "clap" begin
    repeat (13 * 2) (⟦ 12 ∥ basis)
  end

right =
  voice "clap" begin
    ⟦ 12 ∥ (iter 13 basis)
  end

main = runGroove 120 (right ، left)

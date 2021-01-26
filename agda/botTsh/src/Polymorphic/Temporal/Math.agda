
module Polymorphic.Temporal.Math where

import Data.Nat                              as Nat
import Data.Nat.Properties                   as NatProp
import Data.Integer                          as Int
import Data.Empty                            as Void
import Relation.Nullary                      as Dec
import Relation.Binary.PropositionalEquality as Eq

open Int     using (ℤ; ∣_∣; _-_; +_; _⊖_)
open Nat     using (ℕ; zero; suc; _+_; _*_; _≤_ ; s≤s ; z≤n ;_⊔_)
open NatProp using (_≤?_ ; ≤-pred ; suc-injective ; ≤-reflexive; ⊔-comm)
open Dec     using (yes ; no ; ¬_)
open Eq      using (_≡_ ; refl; sym; cong ; trans)
open Void    using ( ⊥-elim ; ⊥)

+-assoc : ∀ (n m k : ℕ) → (n + m) + k ≡ n + (m + k)
+-assoc zero    m k     = refl
+-assoc (suc n) m k
  rewrite +-assoc n m k = refl

n+0≡n : ∀ (n : ℕ) → (n + 0) ≡ n
n+0≡n zero                    = refl
n+0≡n (suc n) rewrite n+0≡n n = refl

n+sm≡s[n+m] : ∀ (n m : ℕ) → n + suc m ≡ suc (n + m)
n+sm≡s[n+m] zero m                            = refl
n+sm≡s[n+m] (suc n) m rewrite n+sm≡s[n+m] n m = refl

+-comm : ∀ (n m : ℕ) → n + m ≡ m + n
+-comm zero    m                    = sym (n+0≡n m)
+-comm (suc n) m rewrite +-comm n m = sym (n+sm≡s[n+m] m n)

s[n+m]≡m+sn : {n m : ℕ} → suc (n + m) ≡ m + suc n
s[n+m]≡m+sn {zero}  {m}     rewrite +-comm m 1 = refl
s[n+m]≡m+sn {suc n} {zero}  rewrite +-comm n 0 = refl
s[n+m]≡m+sn {suc n} {suc m}
  rewrite s[n+m]≡m+sn {n} {m}
        | +-comm n (suc m)
        | +-comm m (suc (suc n))
        | +-comm m n = refl

*-distrib-+ : ∀ (n m k : ℕ) → (n + m) * k ≡ n * k + m * k
*-distrib-+ zero m k        = refl
*-distrib-+ (suc n) m k
  rewrite *-distrib-+ n m k = sym (+-assoc k (n * k) (m * k))

n≤m→n⊔m≡m : {n m : ℕ} → n ≤ m → n ⊔ m ≡ m
n≤m→n⊔m≡m {zero}  {m}     n≤m    = refl
n≤m→n⊔m≡m {suc n} {suc m} n≤m
  rewrite n≤m→n⊔m≡m (≤-pred n≤m) = refl

n≤m→n⊔m≡[m-n]+n : {n m : ℕ} → n ≤ m → ∣ m ⊖ n ∣ + n ≡ m
n≤m→n⊔m≡[m-n]+n {zero}  {    m} _     rewrite +-comm m 0 | +-comm m 0 = refl
n≤m→n⊔m≡[m-n]+n {suc n} {suc m} sn≤sm
  rewrite +-comm (∣ m ⊖ n ∣) (suc n)
        | +-comm n (∣ m ⊖ n ∣)
        | n≤m→n⊔m≡[m-n]+n (≤-pred sn≤sm) = refl

n≤m→n⊔m≡n+[m-n] : {n m : ℕ} → n ≤ m → n + ∣ m ⊖ n ∣ ≡ m
n≤m→n⊔m≡n+[m-n] {n} {m} n≤m rewrite +-comm n (∣ m ⊖ n ∣) = n≤m→n⊔m≡[m-n]+n n≤m

≤-¬pred : (n m : ℕ) →  ¬(n ≤ m) → ¬(suc n ≤ suc m)
≤-¬pred zero     _ ¬n≤m = ⊥-elim (¬n≤m z≤n)
≤-¬pred (suc n) m  ¬n≤m
  with suc (suc n) ≤? suc m
... | yes p = ⊥-elim (¬n≤m (≤-pred p))
... | no ¬p = ¬p

¬≤-pred : (n m : ℕ) → ¬(suc n ≤ suc m) → ¬(n ≤ m)
¬≤-pred (zero)  _       ¬sn≤sm = ⊥-elim (¬sn≤sm (s≤s z≤n))
¬≤-pred (suc n) (zero)  ¬sn≤sm
 with suc n ≤? 0
... | no ¬p = ¬p
¬≤-pred (suc n) (suc m) ¬sn≤sm
 with n ≤? m
... | yes p = ⊥-elim (¬sn≤sm (s≤s (s≤s p)))
... | no ¬p = ≤-¬pred n m ¬p

¬n≤m→m≤n : {n m : ℕ} → ¬ (n ≤ m) → m ≤ n
¬n≤m→m≤n {zero}  {zero}  ¬n≤m = z≤n
¬n≤m→m≤n {zero}  {suc m} ¬n≤m = ⊥-elim (¬n≤m z≤n)
¬n≤m→m≤n {suc n} {zero}  ¬n≤m = z≤n
¬n≤m→m≤n {suc n} {suc m} ¬n≤m = s≤s (¬n≤m→m≤n (¬≤-pred n m ¬n≤m))


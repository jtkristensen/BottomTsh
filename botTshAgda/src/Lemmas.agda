
module Lemmas where

import Data.Nat                              as Nat
import Data.Nat.Properties                   as NatProp
import Data.Nat.LCM                          as NatLCM
import Data.Nat.GCD                          as NatGCD
import Data.Nat.Divisibility                 as NatDiv
import Data.Nat.DivMod                       as DivMod
import Data.Integer                          as Int
import Data.Integer.Properties               as IntProp
import Data.Bool                             as Bool
import Data.Empty                            as Void
import Relation.Binary.PropositionalEquality as Eq
import Relation.Nullary.Decidable            as Dec
import Relation.Nullary                      as Null-Ary
import Relation.Binary                       as Bin-Ary
import Agda.Builtin.Unit                     as Unit
import Agda.Builtin.Nat                      as BuiltinNat
import Algebra.Structures                    as Alg
import Relation.Binary.Reasoning.Base.Triple as Reasoning

open import Data.Sign.Base using    ( opposite )
                           renaming ( _*_ to _*ₛ_ ; - to minus ; + to plus)

open Nat        using    ( ℕ; zero; suc; _+_; _*_ ; z≤n ; s≤s ; ≤-pred)
open Int        using    ( ℤ; +_; -_ ; _-_ ; +0 ; _⊔_
                         ; _≤_; -≤- ; -≤+ ; +≤+ ; ∣_∣ ; _⊖_
                         ; sign ; _◃_)
                renaming ( _+_ to _⊕_; _*_ to _∙_ )
open Alg        using    ( IsMagma )
open Dec        using    ( True; False ; isYes ; isNo ; fromWitness ; toWitness)
open Null-Ary   using    ( Dec ; yes ; no ; ¬_ )
open NatProp    using    ( _≟_ ; +-comm; *-comm; 0≢1+n; +-assoc; *-assoc)
open NatLCM     using    ( lcm; m∣lcm[m,n]; n∣lcm[m,n]; lcm-comm; lcm-least )
open NatGCD     using    ( gcd; gcd[m,n]∣m; gcd[m,n]∣n )
open NatDiv     using    ( quotient ; _∣_ ; ∣-trans; n∣n ;∣-antisym; 1∣_; _∣0 )
open IntProp    using    ( +-injective ; drop‿+≤+ ; drop‿-≤- ; _≤?_
                         ; +-isMagma ; *-isMagma ; 0≤n-m⇒m≤n ; +-mono-≤ ;
                           ≤-trans ; n⊖n≡0 ; ≤-reflexive ; *-zeroˡ; *-zeroʳ;
                           neg-distrib-+; neg-involutive)
                renaming ( _≟_ to _=?_ ; +-assoc to ⊕-assoc; +-comm to ⊕-comm)
open DivMod     using    ( _/_ )
open Bool       using    ( T ; not )
open Unit       using    ( ⊤ )
open Eq         using    ( _≡_ ; _≢_ ; sym ; refl)
open Void       using    ( ⊥ ; ⊥-elim )
open NatLCM     using    ( lcm ; lcm-comm)
open NatGCD     using    ( gcd ; gcd[m,n]∣m)

infix 4 _≢0
_≢0 : ℕ → Set
n ≢0 = False (n ≟ 0)

infix 4 _≯_
_≯_ : ℤ → ℤ → Set
n ≯ m = True (n ≤? m)

-- The quotient of `n` into `lcm n m`.
q₁ : (n : ℕ) (m : ℕ) → ℕ
q₁ n m = quotient (m∣lcm[m,n] n m)

-- ******************
-- *** Basic Math ***
-- ******************

∣x-x∣≡0 : ∀ (x : ℤ) → ∣ x - x ∣ ≡ 0
∣x-x∣≡0 (+_       0) = refl
∣x-x∣≡0 (+_ (suc n))
  with ∣x-x∣≡0 (+ n)
... | _
  rewrite n⊖n≡0 n
        = refl
∣x-x∣≡0 (ℤ.negsuc  zero  ) = refl
∣x-x∣≡0 (ℤ.negsuc (suc n)) = ∣x-x∣≡0 (ℤ.negsuc n)


∣+s-+0∣≡s : ∀ (s : ℕ) → ( ∣ (+ s) - +0 ∣ ) ≡ s
∣+s-+0∣≡s  zero                      = refl
∣+s-+0∣≡s (suc s) rewrite +-comm s 0 = refl

*-distrib-+ : ∀ (n m k : ℕ) → (n + m) * k ≡ n * k + m * k
*-distrib-+ zero m k = refl
*-distrib-+ (suc n) m k
  rewrite *-distrib-+ n m k
        = sym (+-assoc k (n * k) (m * k))

*suc : ∀ (n k : ℕ) → n * k + n ≡ n * suc k
*suc zero     k      = refl
*suc (suc n)  zero
  rewrite *-comm n 1
        | *-comm n 0
        | +-comm n 0
        = refl
*suc (suc n) (suc k)
  rewrite *-comm n (suc k)
        | +-comm n (k * n)
        | *-comm k n
        | +-comm (k + (n * k + n)) (suc n)
        | +-comm n (k + (n * k + n))
        | *suc n k
        | +-assoc k (n * suc k) n
        | *suc n (suc k)
        = refl

n∣n*m : (n m : ℕ) → n ∣ n * m
n∣n*m n m
  rewrite *-comm n m
        = _∣_.divides m refl

m∣n*m : (n m : ℕ) → m ∣ n * m
m∣n*m n m = _∣_.divides n refl

lcm[n,m]∣n*m : (n m : ℕ) → lcm n m ∣ n * m
lcm[n,m]∣n*m n m = lcm-least (n∣n*m n m) (m∣n*m n m)

n≢0∧m≢0→nm≢0 : (n m : ℕ) → (n ≢0) → (m ≢0) → (n * m) ≢0
n≢0∧m≢0→nm≢0 n@(suc n-1) m@(suc m-1) n≢0 m≢0 = ⊤.tt

n≢0∧c∣n→c≢0 : (n c : ℕ) → (n ≢0) → (c ∣ n) → c ≢0
n≢0∧c∣n→c≢0 (suc n) zero _ (_∣_.divides (suc q) eq)
  rewrite *-comm q 0
        = 0≢1+n {n} (sym eq)
n≢0∧c∣n→c≢0 (suc n) (suc c) _ (_∣_.divides (suc q) eq) = ⊤.tt

n≢0∧m≢0→lcm[n,m]≢0 : (n m : ℕ) (n≢0 : n ≢0) (m≢0 : m ≢0) → (lcm n m) ≢0
n≢0∧m≢0→lcm[n,m]≢0 n m n≢0 m≢0
  = n≢0∧c∣n→c≢0
     (n * m)
     (lcm n m)
     (n≢0∧m≢0→nm≢0 n m n≢0 m≢0)
     (lcm-least (n∣n*m n m) (m∣n*m n m))

n≢0∧m≢0→gcd[n,m]≢0 : (n m : ℕ) → (n ≢0) → (m ≢0) → (gcd n m) ≢0
n≢0∧m≢0→gcd[n,m]≢0 n m n≢0 m≢0 =
  n≢0∧c∣n→c≢0 n (gcd n m) n≢0 (gcd[m,n]∣m n m)

n≢0∧n≡cm→c≢0 : ∀ n m c → n ≢0 → n ≡ c * m → c ≢0
n≢0∧n≡cm→c≢0 (suc n) m (suc c) n≢0 n≡cm = ⊤.tt

n≢0∧m≢0→q[lcm[n,m]]≢0 : (n m : ℕ) (n≢0 : n ≢0) (m≢0 : m ≢0)
                      → quotient (m∣lcm[m,n] n m) ≢0
n≢0∧m≢0→q[lcm[n,m]]≢0 n m n≢0 m≢0
  = n≢0∧n≡cm→c≢0
    (lcm n m) n
    (quotient (m∣lcm[m,n] n m))
    (n≢0∧m≢0→lcm[n,m]≢0 n m n≢0 m≢0)
    (_∣_.equality (m∣lcm[m,n] n m))

u≢0∧d≢0→q₁ud≢0 : (u d : ℕ) → (u≢0 : u ≢0) → (d ≢0) → (q₁ u d) ≢0
u≢0∧d≢0→q₁ud≢0 u d u≢0 d≢0
  with n≢0∧m≢0→gcd[n,m]≢0 u d u≢0 d≢0
... | _
  with gcd u d ≟ 0
... | no _ = n≢0∧m≢0→q[lcm[n,m]]≢0 u d u≢0 d≢0

n≤nℕ : {n : ℕ} → n Nat.≤ n
n≤nℕ {zero } = z≤n
n≤nℕ {suc n} with n≤nℕ
...            | n≤n = s≤s n≤n

n≤nℤ : {n : ℤ} → n ≤ n
n≤nℤ {+_       n} = +≤+ n≤nℕ
n≤nℤ {ℤ.negsuc n} = -≤- n≤nℕ

n≤m→n≤sm : (n m : ℕ) → (n Nat.≤ m) → (n Nat.≤ (suc m))
n≤m→n≤sm    zero     m           _   = z≤n
n≤m→n≤sm n@(suc n-1) m@(suc m-1) n≤m = s≤s (n≤m→n≤sm n-1 m-1 (≤-pred n≤m))

sn≤m→n≤m : (n m : ℕ) → ((suc n) Nat.≤ m) → (n Nat.≤ m)
sn≤m→n≤m    zero     m           sn≤m = z≤n
sn≤m→n≤m n@(suc n-1) m@(suc m-1) sn≤m = s≤s (sn≤m→n≤m n-1 m-1 (≤-pred sn≤m))

≤-cong-+ℕ : {n m k : ℕ} → n Nat.≤ m → n + k Nat.≤ m + k
≤-cong-+ℕ {n} {m} {zero   } n≤m
  rewrite +-comm n 0
        | +-comm m 0
        = n≤m
≤-cong-+ℕ {n} {m} {suc k-1} n≤m
  rewrite +-comm n (suc k-1)
        | +-comm m (suc k-1)
        | +-comm k-1 n
        | +-comm k-1 m
  with ≤-cong-+ℕ {n} {m} {k-1} n≤m
... | n+k-1≤m+k-1 = s≤s n+k-1≤m+k-1

+cong₂≡  : {n m k₁ k₂ : ℤ} → n ≡ m → k₁ ≡ k₂ → (n ⊕ k₁) ≡ (m ⊕ k₂)
+cong₂≡  n≡m k₁≡k₂ = (IsMagma.∙-cong +-isMagma) n≡m k₁≡k₂

*cong₂≡  : {n m k₁ k₂ : ℤ} → n ≡ m → k₁ ≡ k₂ → (n ∙ k₁) ≡ (m ∙ k₂)
*cong₂≡  n≡m k₁≡k₂ = (IsMagma.∙-cong *-isMagma) n≡m k₁≡k₂

n≤sn : {n : ℕ} → n Nat.≤ (suc n)
n≤sn {zero   } = z≤n
n≤sn {suc n-1} = s≤s n≤sn

m-[n+1]≤m-n : (n m : ℕ) → m ⊖ (suc n) ≤ m ⊖ n
m-[n+1]≤m-n zero     zero   = -≤+
m-[n+1]≤m-n zero    (suc m) = +≤+ n≤sn
m-[n+1]≤m-n (suc n)  zero   = -≤- n≤sn
m-[n+1]≤m-n (suc n) (suc m) = m-[n+1]≤m-n n m

n≤m→0≤m-nℕ : (n m : ℕ) → n Nat.≤ m → +0 ≤ m ⊖ n
n≤m→0≤m-nℕ zero     _      _     = +≤+ z≤n
n≤m→0≤m-nℕ (suc n) (suc m) sn≤sm = n≤m→0≤m-nℕ n m (≤-pred sn≤sm)

n≤m→0≤m-n : (n m : ℤ) → n ≤ m → +0 ≤ m - n
n≤m→0≤m-n _ _ n≤m with n≤m
n≤m→0≤m-n .(ℤ.negsuc m) .(ℤ.negsuc n) _    | -≤- {m} {n} n≤mℕ = n≤m→0≤m-nℕ n m n≤mℕ
n≤m→0≤m-n .(ℤ.negsuc m) .(+ n)        _    | -≤+ {m} {n}
  rewrite +-comm n (suc m)
        = +≤+ z≤n
n≤m→0≤m-n .(+ m)        .(+ n)        m≤n  | +≤+ {m} {n} m≤nℕ
  with m | n
... | zero    | zero    = +≤+ z≤n
... | zero    | suc n-1 = +≤+ z≤n
... | suc m-1 | suc n-1 = n≤m→0≤m-nℕ m-1 n-1 (≤-pred m≤nℕ)

0≤m-n→n≤m : (n m : ℤ) → +0 ≤ m - n → n ≤ m
0≤m-n→n≤m n m 0≤m-n = 0≤n-m⇒m≤n 0≤m-n

-n+1≤0 : ∀ { n m } → Int.suc (ℤ.negsuc n) ≤ (+ m)
-n+1≤0 {zero } = +≤+ z≤n
-n+1≤0 {suc n} = -≤+

s≤sℤ : ∀ {x y} → x ≤ y → Int.suc x ≤ Int.suc y
s≤sℤ {+        x} {+        y} x≤y = +≤+ (s≤s (drop‿+≤+ x≤y))
s≤sℤ {ℤ.negsuc x} {+ y} _ = -n+1≤0 {x}
s≤sℤ {ℤ.negsuc zero}    {ℤ.negsuc  zero  } (-≤- y≤x) = ≤-reflexive refl
s≤sℤ {ℤ.negsuc (suc x)} {ℤ.negsuc  zero  } (-≤- y≤x) = -≤+
s≤sℤ {ℤ.negsuc (suc x)} {ℤ.negsuc (suc y)} (-≤- y≤x) = -≤- (≤-pred y≤x)

+-cong-≤ˡ₁ : ∀ i j k → i Nat.≤ j → i Nat.≤ j + k
+-cong-≤ˡ₁  zero    _ _ _        = z≤n
+-cong-≤ˡ₁ (suc i) (suc j) k i≤j = s≤s (+-cong-≤ˡ₁ i j k (≤-pred i≤j))
+-cong-≤ˡ : ∀ {n m i j} → i Nat.≤ j → n Nat.≤ m → i + n Nat.≤ j + m
+-cong-≤ˡ {zero } {m} {i} {j} i≤j n≤m
  rewrite +-comm i 0 = +-cong-≤ˡ₁ i j m i≤j
+-cong-≤ˡ {suc n} {suc m} {i} {j} i≤j n≤m
  rewrite +-comm i (suc n)
        | +-comm j (suc m)
        = s≤s (+-cong-≤ˡ (≤-pred n≤m) i≤j)

*-cong-≤ˡ : ∀ {k n m} → n Nat.≤ m → n * k Nat.≤ m * k
*-cong-≤ˡ {zero} {n} _
  rewrite *-comm n 0
        = z≤n
*-cong-≤ˡ {suc k} {n} {m} n≤m
  rewrite *-comm n (suc k)
        | *-comm m (suc k)
        | *-comm k n
        | *-comm k m
  with *-cong-≤ˡ {k} n≤m
... | nk≤mk = +-cong-≤ˡ n≤m nk≤mk

*-cong-≤ʳ : ∀ {k n m} → n Nat.≤ m → k * n Nat.≤ k * m
*-cong-≤ʳ {k}{n}{m}
  rewrite *-comm k n
        | *-comm k m
        = *-cong-≤ˡ

∙-swap-*-≥0 : ∀ n m → (+ n) ∙ (+ m) ≡ + (n * m)
∙-swap-*-≥0  zero       m rewrite *-zeroˡ (+ m)              = refl
∙-swap-*-≥0 (suc n)  zero rewrite *-zeroʳ (+ n) | *-comm n 0 = refl
∙-swap-*-≥0 (suc n) (suc m)                                  = refl

+*-→- : ∀ i j → + i ∙ ℤ.negsuc j ≤ +0
+*-→-  zero   j rewrite *-zeroˡ (ℤ.negsuc j) = +≤+ z≤n
+*-→- (suc i)  zero   = -≤+
+*-→- (suc i) (suc j) = -≤+

-*+→- : ∀ i j → ℤ.negsuc i ∙ + j ≤ +0
-*+→-      i   zero rewrite *-zeroʳ (ℤ.negsuc i) = +≤+ z≤n
-*+→-  zero   (suc j) = -≤+
-*+→- (suc i) (suc j) = -≤+

+*+→+ : ∀ i j → +0 ≤ + i ∙ + j
+*+→+ i j
  rewrite ∙-swap-*-≥0 i j
        = +≤+ z≤n

∙+-cancelˡ-≤ : ∀ k {x y} → x ≤ y → (+ k) ∙ x ≤ (+ k) ∙ y
∙+-cancelˡ-≤ zero    {x} {y} x≤y rewrite *-zeroˡ x = +≤+ z≤n
∙+-cancelˡ-≤ (suc k) {+ zero} {+ y} x≤y
  rewrite ∙-swap-*-≥0 (suc k) y
        |  *-zeroʳ (+ suc k)
        = +≤+ z≤n
∙+-cancelˡ-≤ (suc k) {+ (suc x)} {+   zero } x≤y
  with suc x Nat.≤? 0
∙+-cancelˡ-≤ (suc k) {+_ (suc x)} {+_ zero} x≤y | no ¬p = ⊥-elim (¬p (drop‿+≤+ x≤y))
∙+-cancelˡ-≤ (suc k) {+ (suc x)} {+ (suc y)} sx≤sy
  rewrite ∙-swap-*-≥0 (suc k) (suc x)
        | ∙-swap-*-≥0 (suc k) (suc y)
        | *-comm k (suc x)
        | *-comm k (suc y)
  with  ≤-pred (drop‿+≤+ (sx≤sy))
... | x≤y  = +≤+ (s≤s (+-cong-≤ˡ x≤y (+-cong-≤ˡ (NatProp.≤-reflexive {k} refl) (*-cong-≤ˡ x≤y))))
∙+-cancelˡ-≤ (suc k) {ℤ.negsuc x} {+        y}  x≤y
  with +*-→- (suc k) x | +*+→+ (suc k) y
... | skx≤0 | 0≤sky = ≤-trans skx≤0 0≤sky
∙+-cancelˡ-≤ (suc k) {ℤ.negsuc x} {ℤ.negsuc y} x≤y
  with drop‿-≤- x≤y
... | -y≤-x = -≤- (+-cong-≤ˡ -y≤-x (*-cong-≤ʳ {k} (s≤s -y≤-x)))

k∣x∣≡∣kx∣ : ∀ k x → k * ∣ x ∣ ≡ ∣ + k ∙ x ∣
k∣x∣≡∣kx∣  zero             _  = refl
k∣x∣≡∣kx∣ (suc k) (+        x)
  rewrite ∙-swap-*-≥0 (suc k) x = refl
k∣x∣≡∣kx∣ (suc k) (ℤ.negsuc n)  = refl

0≤n∧0≤m→∣n∣+∣m∣≡∣n⊕m∣ : ∀ {n m} → +0 ≤ n → +0 ≤ m → ∣ n ∣ + ∣ m ∣ ≡ ∣ n ⊕ m ∣
0≤n∧0≤m→∣n∣+∣m∣≡∣n⊕m∣ {+_ n} {+_ m} 0≤n 0≤m = refl

*ₛ-comm : ∀ x y → x *ₛ y ≡ y *ₛ x
*ₛ-comm minus minus = refl
*ₛ-comm minus plus  = refl
*ₛ-comm plus  minus = refl
*ₛ-comm plus  plus  = refl

k∙[x-y]≡kx-ky : ∀ k x y → k ∙ (x - y) ≡ k ∙ x - k ∙ y
k∙[x-y]≡kx-ky k x y
  rewrite IntProp.*-distribˡ-+ k x (- y)
        | IntProp.*-comm       k y
        | IntProp.neg-distribˡ-* y k
        | *ₛ-comm (sign (- y)) (sign k)
        | *-comm ∣ - y ∣ ∣ k ∣
        = refl

k*∣n∣≡∣kn∣ : ∀ k n → k * ∣ n ∣ ≡ ∣ + k ∙ n ∣
k*∣n∣≡∣kn∣  zero   n                                   = refl
k*∣n∣≡∣kn∣ (suc k) (+ n) rewrite ∙-swap-*-≥0 (suc k) n = refl
k*∣n∣≡∣kn∣ (suc k) (ℤ.negsuc n)                        = refl

k∙∣x-y∣≡∣kx-ky∣ : ∀ k x y → k * ∣ x - y ∣ ≡ ∣ (+ k) ∙ x - (+ k) ∙ y ∣
k∙∣x-y∣≡∣kx-ky∣ k x y
  rewrite k*∣n∣≡∣kn∣    k (x - y)
        | k∙[x-y]≡kx-ky (+ k) x y
        = refl

i≤0→i-n≤0-n : ∀ i n → (ℤ.negsuc i) - (+ n) ≤ +0 - (+ n)
i≤0→i-n≤0-n i n
  rewrite IntProp.+-identityˡ (- (+ n))
        | ⊕-comm (- (+ (suc i))) (- (+ n))
        = IntProp.m-n≤m (- (+ n)) (suc i)

n-m≡sn-sm : ∀ n m → (suc n) ⊖ (suc m) ≡ n ⊖ m
n-m≡sn-sm zero m          = refl
n-m≡sn-sm (suc n) zero    = refl
n-m≡sn-sm (suc n) (suc m) = refl

n≤m→n-m≤0 : ∀ {n m} → n Nat.≤ m → (+ n) - (+ m) ≤ +0
n≤m→n-m≤0 (z≤n {m}) = IntProp.m-n≤m (+ zero) m
n≤m→n-m≤0 (s≤s {n} {m} n≤m)
  rewrite n-m≡sn-sm n m
        | sym (IntProp.[+m]-[+n]≡m⊖n n m) = n≤m→n-m≤0 n≤m

x≤y→x-y≤0 : ∀ {x y} → x ≤ y → x - y ≤ +0
x≤y→x-y≤0 (-≤- (z≤n {m})) = IntProp.m⊖n≤m zero m
x≤y→x-y≤0 (-≤- (s≤s {m} {n} m≤n))
  rewrite neg-involutive (+ m)
        | sym (IntProp.[+m]-[+n]≡m⊖n m n) = n≤m→n-m≤0 m≤n
x≤y→x-y≤0 (-≤+ {m} {n})
  = ≤-trans (i≤0→i-n≤0-n m n) (IntProp.m-n≤m (+ zero) n)
x≤y→x-y≤0 (+≤+ (z≤n {m})) = IntProp.m-n≤m (+ zero) m
x≤y→x-y≤0 (+≤+ (s≤s {m} {n} m≤n))
  rewrite n-m≡sn-sm m n
        | sym (IntProp.[+m]-[+n]≡m⊖n m n) = n≤m→n-m≤0 m≤n

x≤0∧y≤z→y+x≤z : ∀ x y z → x ≤ +0 → y ≤ z → y ⊕ x ≤ z
x≤0∧y≤z→y+x≤z .(ℤ.negsuc m) y z (-≤+ {m}) y≤z = IntProp.≤-steps-neg (suc m) y≤z
x≤0∧y≤z→y+x≤z .+0 y z (+≤+ {zero} m≤n) y≤z
  rewrite IntProp.+-identityʳ y = y≤z

x₁-[y₂-[x₂-y₁]]≡[x₁-y₁]+[x₂-y₂] : ∀ x₁ y₁ x₂ y₂ →
                                (x₁ - (y₂ - (x₂ - y₁))) ≡ (x₁ - y₁) ⊕ (x₂ - y₂)
x₁-[y₂-[x₂-y₁]]≡[x₁-y₁]+[x₂-y₂] x₁ y₁ x₂ y₂
  rewrite neg-distrib-+ x₂ (- y₁)
        | neg-distrib-+ y₂ (- x₂ ⊕ - (- y₁))
        | neg-involutive y₁
        | neg-distrib-+ (- x₂) y₁
        | neg-involutive x₂
        | sym (⊕-assoc (- y₂) x₂ (- y₁))
        | ⊕-comm (- y₂) x₂
        | ⊕-comm (x₂ - y₂) (- y₁)
        | sym (⊕-assoc x₁ (- y₁) (x₂ - y₂)) = refl

x-[y-z]≡z+[x-y] : ∀ x y z → x - (y - z) ≡ z ⊕ (x - y)
x-[y-z]≡z+[x-y] x y z
  rewrite neg-distrib-+ y (- z)
        | neg-involutive z
        | sym (⊕-assoc x (- y) z)
        | ⊕-comm (x - y) z = refl

x+0≡x : ∀ x → x ⊕ +0 ≡ x
x+0≡x (+_ n) rewrite +-comm n 0 = refl
x+0≡x (ℤ.negsuc n)                      = refl

plus-minus-telescope : ∀ x y z → (x ⊕ y) - (y ⊕ z) ≡ x - z
plus-minus-telescope x y z
  rewrite IntProp.neg-distrib-+ y z
        | IntProp.+-assoc x y  ((- y) ⊕ (- z))
        | sym (IntProp.+-assoc y (- y) (- z))
        | IntProp.m≡n⇒m-n≡0 y y refl
        | sym (IntProp.+-assoc x +0 (- z))
        | x+0≡x x
        = refl

x-y≡k+x-k+y : ∀ x y k → x - y ≡ (k ⊕ x) - (k ⊕ y)
x-y≡k+x-k+y x y k
  rewrite IntProp.+-comm k x
        | plus-minus-telescope x k y
        = refl

x-y≡x+k-y+k : ∀ x y k → x - y ≡ (x ⊕ k) - (y ⊕ k)
x-y≡x+k-y+k x y k
  rewrite IntProp.+-comm y k
        | plus-minus-telescope x k y
        = refl

[m-n]+[j-i]≡[m+[j-i]]-n : ∀ n m i j → (m - n) ⊕ (j - i) ≡ (m ⊕ (j - i)) - n
[m-n]+[j-i]≡[m+[j-i]]-n n m i j
  rewrite IntProp.+-assoc m (- n) (j - i)
        | IntProp.+-comm  (- n) (j - i)
        | IntProp.+-assoc m (j - i) (- n)
        = refl

n≤mi≤j→∣m-n∣+∣j-i∣≡∣m+[j-i]]-n∣ : ∀ n m i j → n ≤ m → i ≤ j
     → ∣ m - n ∣ + ∣ j - i ∣ ≡ ∣ (m ⊕ (j - i)) - n ∣
n≤mi≤j→∣m-n∣+∣j-i∣≡∣m+[j-i]]-n∣ n m i j n≤m i≤j
  rewrite sym (IntProp.0≤n⇒+∣n∣≡n (IntProp.m≤n⇒0≤n-m i≤j))
        | IntProp.+-assoc m (+ ∣ j - i ∣) (- n)
        | IntProp.+-comm  (+ ∣ j - i ∣) (- n)
        | sym (IntProp.+-assoc m (- n) (+ ∣ j - i ∣))
        | sym (IntProp.0≤n⇒+∣n∣≡n (IntProp.m≤n⇒0≤n-m n≤m))
        = refl

n≤m∧0≤k→n≤m+k : ∀ n m k → n ≤ m → +0 ≤ k → n ≤ m ⊕ k
n≤m∧0≤k→n≤m+k n m (+ k) n≤m 0≤k
  with IntProp.≤-steps k n≤m
... | proof
  rewrite
       IntProp.+-comm (+ k) m
       = proof

n≯m∧i≯j→n≯[m+[j-i]] : ∀ {n m i j} → n ≯ m → i ≯ j → n ≯ m ⊕ ( j - i )
n≯m∧i≯j→n≯[m+[j-i]] {n} {m} {i} {j} n≤m i≤j =
  fromWitness (n≤m∧0≤k→n≤m+k n m (j - i)
    (toWitness n≤m)
      (IntProp.m≤n⇒0≤n-m (toWitness i≤j)))

q₁[m,n]*n≡lcm[m,n] : ∀ n m → q₁ m n * m ≡ lcm m n
q₁[m,n]*n≡lcm[m,n] n 0 = refl
q₁[m,n]*n≡lcm[m,n] n (suc m-1)
  rewrite *-comm (q₁ (suc m-1) n) (suc m-1) = refl

q₁[m,n]*n≡lcm[n,m] : ∀ n m → q₁ m  n * m ≡ lcm n m
q₁[m,n]*n≡lcm[n,m] n m
  rewrite lcm-comm n m
        = q₁[m,n]*n≡lcm[m,n] n m

n≡m∧i≡j→ni≡mj : ∀ n m i j → n ≡ m → i ≡ j → n * i ≡ m * j
n≡m∧i≡j→ni≡mj _ _ _ _ n≡m i≡j
  rewrite n≡m | i≡j = refl


n≢0→¬n+m≡0 : ∀ {n m} → n ≢0 → ¬ (n + m ≡ 0)
n≢0→¬n+m≡0 {suc n} {m} n≢0 = λ ()

*-cancelˡ : ∀ {n m i j} → i ≡ j → i ≢0 → n * i ≡ m * j → n ≡ m
*-cancelˡ {i = suc i-1} i≡j _
  rewrite sym i≡j = NatProp.*-cancelʳ-≡ _ _

¬n≡0→n≢0 : ∀ {n} → ¬ n ≡ 0 → n ≢0
¬n≡0→n≢0 {n} n≢0 with n ≟ 0
... | yes p = n≢0 p
... | no ¬p = ⊤.tt

private
  q₁d₁d₂*n₁≡q₂d₂d₁*n₂-lemma :
    ∀ n₁ n₂ d₁ d₂ → d₁ ≢0 → d₂ ≢0 → (n₁ * d₂) ≡ (n₂ * d₁) →
    (q₁ d₁ d₂ * n₁) * (n₂ * d₁) * (n₁ * d₂) ≡ q₁ d₂  d₁ * n₂ * (n₁ * d₂) * (n₂ * d₁)
  q₁d₁d₂*n₁≡q₂d₂d₁*n₂-lemma n₁ n₂ d₁ d₂ d₁≢0 d₂≢0 eq
    rewrite *-comm  (q₁ d₁ d₂) n₁
          | *-comm  (q₁ d₂ d₁) n₂
          | *-comm  n₁ d₂
          | *-comm  n₂ d₁
          | *-assoc (n₁ * q₁ d₁ d₂) (d₁ * n₂) (d₂ * n₁)
          | *-assoc n₁ (q₁ d₁ d₂) (d₁ * n₂ * (d₂ * n₁))
          | *-assoc d₁ n₂ (d₂ * n₁)
          | sym (*-assoc (q₁ d₁ d₂) d₁ (n₂ * (d₂ * n₁)))
          | q₁[m,n]*n≡lcm[m,n] d₂ d₁
          | *-assoc (n₂ * q₁ d₂ d₁) (d₂ * n₁) (d₁ * n₂)
          | *-assoc n₂ (q₁ d₂  d₁) (d₂ * n₁ * (d₁ * n₂))
          | *-assoc d₂ n₁ (d₁ * n₂)
          | sym (*-assoc (q₁ d₂ d₁) d₂ (n₁ * (d₁ * n₂)))
          | q₁[m,n]*n≡lcm[n,m] d₁ d₂
          | *-comm  d₂ n₁
          | *-comm  d₁ n₂
          | *-comm  n₁ (lcm d₁ d₂ * (n₂ * (n₁ * d₂)))
          | *-comm  n₂ (lcm d₁ d₂ * (n₁ * (n₂ * d₁)))
          | *-assoc (lcm d₁ d₂) (n₂ * (n₁ * d₂)) n₁
          | *-assoc (lcm d₁ d₂) (n₁ * (n₂ * d₁)) n₂
          | *-assoc n₂ (n₁ * d₂) n₁
          | *-assoc n₁ d₂ n₁
          | sym (*-assoc n₂ n₁ (d₂ * n₁))
          | *-assoc n₁ (n₂ * d₁) n₂
          | *-assoc n₂ d₁ n₂
          | sym (*-assoc n₁ n₂ (d₁ * n₂))
          | *-comm d₂ n₁
          | *-comm d₁ n₂
          | *-comm n₁ n₂
          | eq
          = refl

q₁d₁d₂*n₁≡q₂d₂d₁*n₂ : ∀ n₁ n₂ d₁ d₂ → (d₁≢0 : d₁ ≢0) → (d₂≢0 : d₂ ≢0)
                    → n₁ * d₂ ≡ n₂ * d₁ → q₁ d₁ d₂ * n₁ ≡ q₁ d₂ d₁ * n₂
q₁d₁d₂*n₁≡q₂d₂d₁*n₂ n₁ n₂ d₁ d₂ d₁≢0 d₂≢0  eq
  with n₁ ≟ 0 | n₂ ≟ 0
...  | yes proof₁  | yes proof₂
  rewrite proof₁ | proof₂
        | *-comm (q₁ d₁ d₂) 0
        | *-comm (q₁ d₂ d₁) 0 = refl
...  | yes proof   | no ¬n₂≡0
  with ¬n≡0→n≢0 ¬n₂≡0
q₁d₁d₂*n₁≡q₂d₂d₁*n₂ zero (suc n₂-1) d₁ d₂ d₁≢0 d₂≢0 eq | _ | _ | _
  = ⊥-elim ((n≢0→¬n+m≡0 d₁≢0) (sym eq))
q₁d₁d₂*n₁≡q₂d₂d₁*n₂ n₁ n₂ d₁ d₂ d₁≢0 d₂≢0 eq | no ¬n₁≡0  | yes proof
  with ¬n≡0→n≢0 ¬n₁≡0
q₁d₁d₂*n₁≡q₂d₂d₁*n₂ (suc n₁-1) zero d₁ d₂ d₁≢0 d₂≢0 eq | _ | _ | _
  = ⊥-elim ((n≢0→¬n+m≡0 d₂≢0) eq)
q₁d₁d₂*n₁≡q₂d₂d₁*n₂ n₁ n₂ d₁ d₂ d₁≢0 d₂≢0 eq | no n₁≢0     | no  n₂≢0
    = *-cancelˡ (sym eq) (n≢0∧m≢0→nm≢0 n₂ d₁ (¬n≡0→n≢0 n₂≢0) d₁≢0)
      (*-cancelˡ eq (n≢0∧m≢0→nm≢0 n₁ d₂ (¬n≡0→n≢0 n₁≢0) d₂≢0)
        (q₁d₁d₂*n₁≡q₂d₂d₁*n₂-lemma n₁ n₂ d₁ d₂ d₁≢0 d₂≢0 eq))

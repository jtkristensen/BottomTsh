
module Agda.Help where


import Relation.Binary.PropositionalEquality as Eq
open import Relation.Nullary.Decidable using (False)

open Eq using ( _≡_ ; refl )

open import Data.Nat using (ℕ; _+_; _*_) renaming (zero to z; suc to s)
open import Data.Nat.Properties using (_≟_)

≡sym : {A : Set} → {a b : A} → a ≡ b → b ≡ a
≡sym refl = refl

≡cong : {A B : Set} → {a b : A} → (f : A → B) → a ≡ b → f a ≡ f b
≡cong _ refl = refl

+idʳ : ∀ n → n + z ≡ n
+idʳ z = refl
+idʳ (s n) = ≡cong s (+idʳ n)

+s : ∀ n m → s (n + m) ≡ n + s m
+s z     m = refl
+s (s n) m = ≡cong s (+s n m)

+comm : ∀ n m → n + m ≡ m + n
+comm z     m = ≡sym (+idʳ m)
+comm (s n) m rewrite +comm n m
                    | ≡sym (+s m n) = refl

+assoc : ∀ n m k → n + (m + k) ≡ (n + m) + k
+assoc  z    m k = refl
+assoc (s n) m k rewrite +assoc n m k = refl

*0ˡ : ∀ n → z * n ≡ z
*0ˡ _     = refl

*0ʳ : ∀ n → n * z ≡ z
*0ʳ  z    = refl
*0ʳ (s n) = *0ʳ n

*idʳ : ∀ n → n * s z ≡ n
*idʳ z     = refl
*idʳ (s n) = ≡cong s (*idʳ n)

mutual
  *s : ∀ n m → n * s m ≡ n + m * n
  *s  z    m = ≡sym (*0ʳ m)
  *s (s n) m rewrite *s n m
                   | *s m n
                   | +assoc m n (m * n)
                   | +assoc n m (n * m)
                   | *comm  n m
                   | +comm  n m = refl

  *comm : ∀ n m → n * m ≡ m * n
  *comm n  z    = *0ʳ n
  *comm n (s m) = *s n m

data psPat : (n : ℕ) → Set where
  none : psPat z
  some : {n : ℕ} → psPat n → psPat (s n)

annex : ∀ n → psPat n
annex  z    = none
annex (s n) = some (annex n)

append : ∀ {n m} → psPat n → psPat m → psPat (n + m)
append  none     p2 = p2
append (some p1) p2 = some (append p1 p2)


strP : ∀ {n} m → psPat n → psPat (m * n)
strP _ _ = {!!}

max : ℕ → ℕ → ℕ
max  z    n = n
max (s n) z = s n
max (s n) (s m) = s (max n m)

data _≤_ : (n m : ℕ) → Set where
  z≤n : (n : ℕ) → z ≤ n
  s≤s : {n m : ℕ} → (n ≤ m) → (s n ≤ s m)

data _<_ : (n m : ℕ) → Set where
  z<s : (n : ℕ) → z < s n
  s<s : {n m : ℕ} → n < m → s n < s m

n≤m→max[nm]≡m : ∀ n m → n ≤ m → max n m ≡ m
n≤m→max[nm]≡m .z m (z≤n .m) = refl
n≤m→max[nm]≡m (s n) (s m) (s≤s leq) = ≡cong s (n≤m→max[nm]≡m n m leq)

maxComm : ∀ n m → max n m ≡ max m n
maxComm z  z    = refl
maxComm z (s m) = refl
maxComm (s n) z = refl
maxComm (s n) (s m) rewrite maxComm n m = refl

_-_ : ℕ → ℕ → ℕ
n - z     = n
z - s _   = z
s n - s m = n - m

<-pred : ∀ {n m} → (s n) < (s m) → n < m
<-pred (s<s n<m) = n<m

≤-pred : ∀ {n m} → (s n) ≤ (s m) → n ≤ m
≤-pred (s≤s n≤m) = n≤m

data DLeq : ℕ → ℕ → Set where
  yes : {n m : ℕ} → n ≤ m → DLeq n m
  no  : {n m : ℕ} → m < n → DLeq n m

isLeq : ∀ n m → DLeq n m
isLeq z     m     = yes (z≤n m)
isLeq (s n) z     = no (z<s n)
isLeq (s n) (s m)
  with isLeq n m
... | yes p = yes (s≤s p)
... | no  p = no  (s<s p)

data M : ℕ → Set where
  none  : (n : ℕ) → M n
  _:+:_ : {n m : ℕ} → M n → M m → M (n + m)
  _:=:_ : {n : ℕ}   → M n → M n → M n

*-distrib-+ : ∀ n m k → (n + m) * k ≡ n * k + m * k
*-distrib-+ z m k = refl
*-distrib-+ (s n) m k rewrite *-distrib-+ n m k
                            | +assoc k (n * k) (m * k) = refl

leqL : ∀ {n m} → n ≤ m → max n m ≡ n + (m - n)
leqL (z≤n _) = refl
leqL (s≤s n≤m) = ≡cong s (leqL n≤m)

leL : ∀ {n m} → n < m → max n m ≡ n + (m - n)
leL (z<s n) = refl
leL (s<s n<m) = ≡cong s (leL n<m)

maxk0 : ∀ k → max k z ≡ k
maxk0 k rewrite maxComm k z = refl

max-comm : ∀ n m → max n m ≡ max m n
max-comm z m rewrite maxk0 m = refl
max-comm (s n) z = refl
max-comm (s n) (s m) rewrite max-comm n m = refl

short : (n m : ℕ) → M n → M m → M (max n m)
short n m m1 m2
  with isLeq n m
... | yes p
  rewrite (leqL p) = m1 :+: none (m - n)
... | no  p
  rewrite max-comm n m | (leL p) = m2 :+: none (n - m)


maxkk : ∀ k → max k k ≡ k
maxkk z = refl
maxkk (s k) = ≡cong s (maxkk k)

+-distrib-max : ∀ n m k → max n m + k ≡ max (n + k) (m + k)
+-distrib-max n m  z rewrite (+idʳ n)
                           | (+idʳ m)
                           | (+idʳ (max n m)) = refl
+-distrib-max n m (s k) rewrite +comm (max n m) (s k)
                              | +-distrib-max n m k
                              | +comm n (s k)
                              | +comm m (s k)
                              | +comm k n
                              | +comm k m
                              | +comm k (max n m) = ≡cong s (+-distrib-max n m k)

*-distrib-max : ∀ n m k → max n m * k ≡ max (n * k) (m * k)
*-distrib-max    z  m k = refl
*-distrib-max (s n) z k rewrite maxk0 (k + n * k) = refl
*-distrib-max (s n) (s m) k
  rewrite *-distrib-max n m k
        | +comm k (n * k)
        | +comm k (m * k)
        | +comm k (max (n * k) (m * k))
        = +-distrib-max (n * k) (m * k) k

data List : (len sum : ℕ) → Set where
  []  : List z z
  _∷_ : {len sum : ℕ} → (n : ℕ) → List len sum → List (s len) (n + sum)

streNl : {len sum : ℕ} → (m : ℕ) → List len sum → List len (sum * m)
streNl     m [] = []
streNl m (_∷_ {_} {sum} n ns)
  rewrite *-distrib-+ n sum m
        = (n * m) ∷ streNl m ns


phrase : ∀ {len sum} → List len sum → psPat len → psPat sum
phrase _ = {!!}

data Rh : (n d : ℕ) → Set where
  tp : {n   : ℕ} → (d : ℕ) → psPat n → Rh n d
  ph : {n s : ℕ} → List n s → (d : ℕ) → psPat n → Rh (s * n) (s * d)


*assoc : ∀ n m k → (n * m) * k ≡ n * (m * k)
*assoc z     m k = refl
*assoc (s n) m k
  rewrite *-distrib-+ m (n * m) k
        | *assoc n m k
        = refl

strR : ∀ m {n d} → Rh n d → Rh (m * n) d
strR m {n} (tp d p) =  tp d (strP m p)
strR m (ph {n} {s₁} ns d p)
  rewrite *assoc m s₁ n
  = tp (s₁ * d) (strP {s₁ * n} m (phrase (streNl n ns) p))

infix 4 _≢0
_≢0 : ℕ → Set
n ≢0 = False (n ≟ 0)

--   n = k + j  ==>  mod-helper k n m j = (m + k) nod (1 + n).
mod-helper : (k n m j : ℕ) → ℕ
mod-helper k n  z     j    = k
mod-helper k n (s m)  z    = mod-helper 0 n m n
mod-helper k n (s m) (s j) = mod-helper (s k) n m j

mod : ∀ n m → {m≢0 : False (m ≟ 0)} → ℕ
mod n m = mod-helper z m n m

-- gcd' n  z    n<m = n
-- gcd' n (s m) n<m = gcd' m (mod n m) {!!}

-- m%n<n : ∀ n m →

-self : ∀ n → n - n ≡ z
-self    z  = refl
-self (s n) = -self n

-n0 : ∀ n → z - n ≡ z
-n0 z = refl
-n0 (s n) = refl

sucSwap : ∀ n m → n + s m ≡ (s n) + m
sucSwap z m = refl
sucSwap (s n) m = ≡cong s (sucSwap n m)

+- : ∀ n k → n ≡ (n + k) - k
+- n z = Eq.sym (+idʳ n)
+- z (s k) = Eq.sym (-self k)
+- (s n) (s k) rewrite (sucSwap n k) = +- (s n) k


+dist-ˡ : ∀ n m k → m ≤ n → (n - m) ≡ ((n + k) - (m + k))
+dist-ˡ n .0 k (z≤n .n) = +- n k
+dist-ˡ (s n) (s m) k (s≤s m≤n) = +dist-ˡ n m k m≤n

+dist-ʳ : ∀ n m k → m ≤ n → (n - m) ≡ ((k + n) - (k + m))
+dist-ʳ n m k m≤n
  rewrite +comm k n
        | +comm k m
        =  +dist-ˡ n m k m≤n

≤reflexive : ∀ k → k ≤ k
≤reflexive z = z≤n z
≤reflexive (s k) =  s≤s (≤reflexive k)

≤mono₁ : ∀ n k → n ≤ (n + k)
≤mono₁ z k = z≤n k
≤mono₁ (s n) k = s≤s (≤mono₁ n k)

≤mono₂ : ∀ n m k → n ≤ m → n ≤ (m + k)
≤mono₂ .0 m k (z≤n .m) = z≤n (m + k)
≤mono₂ .(s _) .(s _) k (s≤s n≤m) = s≤s (≤mono₂ _ _ k n≤m)

≤mono+ : ∀ n m k → n ≤ m → (n + k) ≤ (m + k)
≤mono+ n m k (z≤n .m) rewrite +comm m k = ≤mono₁ k m
≤mono+ (s n) (s m) k (s≤s n≤m) = s≤s (≤mono+ n m k n≤m)

≤mono* : ∀ n m k → n ≤ m → (n * k) ≤ (m * k)
≤mono* .0 m k (z≤n .m) = z≤n (m * k)
≤mono* (s n) (s m) k (s≤s n≤m)
  rewrite +comm k (n * k)
        | +comm k (m * k)
        = ≤mono+ (n * k) (m * k) k (≤mono* n m k n≤m)

*dist- : ∀ n m k → m ≤ n → (n - m) * k  ≡ (n * k) - (m * k)
*dist- n .0 k (z≤n .n) = refl
*dist- (s n) (s m) k (s≤s m≤n)
  rewrite *dist- n m k m≤n
        | +comm k (n * k)
        | +comm k (m * k)
        =  +dist-ˡ (n * k) (m * k) k ( ≤mono* m n k m≤n)

data T : ℕ → ℕ → Set where
  tile : {n : ℕ} → {pre post : ℕ} → (pr≤po : pre ≤ post) → (u : ℕ) → M n → T (post - pre) u

stretchT : {n u : ℕ} → (k : ℕ) → T n u -> T (k * n) u
stretchT k (tile {_}{pr}{po} pr≤po u m)
  rewrite *comm k (po - pr)
        | *dist- po pr k pr≤po
        =  tile (≤mono* pr po k pr≤po) u m

bar : ∀ n m k → n ≤ m → ((m - n) + k) ≡ ((m + k) - n)
bar .0 m k (z≤n .m) = refl
bar .(s _) .(s _) k (s≤s n≤m) = bar _ _ k n≤m

foo : ∀ n m i j → (n ≤ m) → (i ≤ j) -> (m - n) + (j - i) ≡ (m + (j - i)) - n
foo n m .0 j n≤m (z≤n .j) =  bar n m j n≤m
foo n m .(s _) .(s _) n≤m (s≤s i≤j) = foo n m _ _ n≤m i≤j

compose : ∀ {n₁ n₂ u : ℕ} → T n₁ u → T n₂ u → T (n₁ + n₂) u
compose (tile {_}{pr₁}{po₁}pr≤po₁ u m₁) (tile {_}{pr₂}{po₂} pr≤po₂ _ m₂)
  rewrite foo pr₁ po₁ pr₂ po₂ pr≤po₁ pr≤po₂
        = tile (≤mono₂ pr₁ po₁ (po₂ - pr₂) pr≤po₁) u m₁

evalP : ∀ {n} → psPat n → M n
evalP p = {!!}

mediaT : ∀ {n} d → M n → T n d
mediaT = {!!}

eval : {n d : ℕ} → Rh n d → T n d
eval (tp d x) = mediaT d (evalP x)
eval (ph {n} {s₁} x d x₁)
  rewrite *comm s₁ n
        = mediaT (s₁ * d) (evalP (strP n (phrase x x₁)))

data Fin : ℕ → Set where
  fz : ∀ n     → Fin n
  fs : {n : ℕ} → Fin n → Fin (s n)

f2n : {n : ℕ} → Fin n → ℕ
f2n (fz n) = z
f2n (fs f) = s (f2n f)

f2n≤ : ∀ {n} → (m : Fin n) → (f2n m) ≤ n
f2n≤ (fz n) = z≤n n
f2n≤ (fs f) = s≤s (f2n≤ f)

data ⊥tsh : ℕ → ℕ → Set where
  voice : {n d : ℕ} → Rh n d → ⊥tsh n d
  loop  : {n d : ℕ}(m   : ℕ) → ⊥tsh n d → ⊥tsh (m * n) d

u↑ : {n d : ℕ} → (u : ℕ) → ⊥tsh n d → ⊥tsh (u * n) (u * d)
u↑ u (voice r)   = {!!}
u↑ u (loop {n} m bt)
  rewrite Eq.sym(*assoc u m n)
        | *comm u m
        | *assoc m u n
  = loop m (u↑ u bt)


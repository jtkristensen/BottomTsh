
module Tiled.Polymorphic.Temporal.Media where

import Polymorphic.Temporal.Media            as PTM
import Relation.Nullary.Decidable            as Decide0
import Relation.Nullary                      as Dec0
import Data.Nat                              as Nat
import Data.Nat.Properties                   as NatProp
import Data.Integer                          as Int
import Data.Integer.Properties               as IntProp
import Relation.Binary.PropositionalEquality as Eq
import Agda.Builtin.Unit                     as Unit
import Data.Bool                             as Bool
import Data.Empty                            as Void

open import Lemmas
open PTM     using    ( Media ; _⊨_ )
             renaming (    none to noneM
                      ;    some to someM
                      ;     map to mapM
                      ; stretch to stretchM
                      ;   delay to delayM )
open Nat     using    ( ℕ ; z≤n ; s≤s ; zero ; suc ; _+_ ; _*_ )
open NatProp using    ( _≟_ ; *-distribʳ-∸ ; ≤-pred )
open Int     using    ( ℤ ; +0 ; +_ ; _⊖_ ; _-_ ; ∣_∣ ; +≤+ ; -≤+ ; -≤-; _≤_)
             renaming (_+_ to _⊕_ ; _*_ to _∙_ )
open IntProp using    ( _≤?_ ; ≤-reflexive ; ∣⊖∣-< ; +-identityˡ; *-zeroˡ ; *-zeroʳ ; +-monoʳ-≤
                      ; drop‿+≤+ ; drop‿-≤- ; ≤-trans ; +-mono-≤)
open Decide0 using    ( True ; False ; isYes ; fromWitness ; toWitness)
open Dec0    using    ( yes  ; no    )
open Eq      using    ( _≡_ ; sym ; refl )
open Unit    using    ( ⊤ ; tt )
open Bool    using    ( T )
open Void    using    ( ⊥ ; ⊥-elim )

-- -- ******************
-- -- *** Definition ***
-- -- ******************

data Tile (A : Set) : (duration unit : ℕ ) → Set where
  tile  :  {n : ℕ} → (pr po : ℤ) → {pr≤po : pr ≯ po } → (u : ℕ) → {u≢0 : u ≢0}
        → Media A n  → Tile A (∣ po - pr ∣) u

-- -- *****************************
-- -- *** Temporal constructors ***
-- -- *****************************

none : ∀ {A } s u → {u≢0 : u ≢0} → Tile A s u
none s u {u≢0}
  rewrite sym (∣+s-+0∣≡s s) = tile +0 (+ s) {tt} u {u≢0} (noneM s)

some : ∀ {A} (a : A) s u → {u≢0 : u ≢0} → Tile A s u
some a s u {u≢0}
  rewrite sym (∣+s-+0∣≡s s) = tile +0 (+ s) {tt} u {u≢0} (someM s a)

mediaT : ∀ {A n} → Media A n → (d : ℕ) → {d≢0 : d ≢0} → Tile A n d
mediaT {_}{n} m d {d≢0}
  rewrite sym (∣+s-+0∣≡s n) = tile +0 (+ n) {tt} d {d≢0} m

-- -- ************************
-- -- *** Basic operations ***
-- -- ************************

map : ∀ {n d} → {A B : Set} → (A → B) → Tile A n d → Tile B n d
map f (tile pr po {pr≤po} u {u≢0} m) = tile pr po {pr≤po} u {u≢0} (mapM f m)

stretch : ∀ { A } k { n d } → Tile A n d → Tile A (k * n) d
stretch k (tile pr po {pr≤po} u {u≢0} m)
  rewrite k∙∣x-y∣≡∣kx-ky∣ k po pr
        = tile (+ k ∙ pr) (+ k ∙ po) {fromWitness (∙+-cancelˡ-≤ k (toWitness pr≤po))}  u {u≢0}
          (stretchM k m)

delay← : ∀ { A } { n d } (k : ℕ) → Tile A n d → Tile A n d
delay← k (tile pr po {pr≤po} d {d≢0} m)
  rewrite x-y≡x+k-y+k po pr (+ (k))
        = tile
        (pr ⊕ (+ (k))) (po ⊕ (+ (k)))
        {fromWitness ( +-mono-≤ (toWitness pr≤po) (≤-reflexive refl))} d {d≢0} m

delay→ : ∀ { A } { n d } (k : ℕ) → Tile A n d → Tile A n d
delay→ k (tile pr po {pr≤po} d {d≢0} m) =
  tile pr po {pr≤po} d {d≢0} (delayM (+ k) m)

infix 3 _%_
_%_ : {A : Set} → {n₁ n₂ d : ℕ} → Tile A n₁ d → Tile A n₂ d → Tile A (n₁ + n₂) d
tile pr₁ po₁ {pr≤po₁} u {u≢0} m₁ % tile pr₂ po₂ {pr≤po₂} .u m₂
  rewrite n≤mi≤j→∣m-n∣+∣j-i∣≡∣m+[j-i]]-n∣ pr₁ po₁ pr₂ po₂ (toWitness pr≤po₁) (toWitness pr≤po₂)
  with po₁ - pr₂
... | d
  with d ≤? +0
... | yes _ =
  tile pr₁ (po₁ ⊕ (po₂ - pr₂)) { n≯m∧i≯j→n≯[m+[j-i]] pr≤po₁ pr≤po₂ } u {u≢0} (delayM (Int.-_ d) m₁ ⊨ m₂)
... | no  _ =
  tile pr₁ (po₁ ⊕ (po₂ - pr₂)) {n≯m∧i≯j→n≯[m+[j-i]] pr≤po₁ pr≤po₂} u {u≢0} (m₁ ⊨ delayM d m₂)

tileA0d≡tileA[x-x]d : ∀ { A } x d → Tile A 0 d ≡ Tile A (∣ x - x ∣) d
tileA0d≡tileA[x-x]d x d rewrite ∣x-x∣≡0 x = refl

reset : ∀ {A n d} → Tile A n d → Tile A 0 d
reset {a}{n}{d}(tile pr _ u {u≢0} m)
  rewrite tileA0d≡tileA[x-x]d {a} pr d
        = tile pr pr {fromWitness (≤-reflexive refl)} u {u≢0} m

-- -- no rule for coReset (not nessesary yet).
-- -- no rule for inverse (otherwise, no guaranty for pre ≤ post).
-- -- no rule for sync (not possible! -> remember to note this in report).

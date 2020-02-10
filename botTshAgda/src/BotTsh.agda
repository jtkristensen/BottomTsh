
module BotTsh where

import Pattern                               as Pat
import Rhythm                                as Rhy
import Data.Nat                              as Nat
import Data.Rational                         as Rat
import Data.Fin                              as Fin
import Data.Nat.LCM                          as LCM
import Data.Integer                          as Int
import Relation.Nullary.Decidable            as Dec
import Data.List                             as List
import Relation.Nullary.Decidable            as Dec
import Data.Nat.Properties                   as NatProp
import Agda.Builtin.String                   as String
import Relation.Binary.PropositionalEquality as Eq

-- rendering
open import Agda.Builtin.IO
open import Agda.Builtin.Unit
open import Audio

import Tiled.Polymorphic.Temporal.Media as TPTM
import       Polymorphic.Temporal.Media as  PTM

open import Lemmas
open import NatList public

open TPTM    using    ( Tile ; reset ; _%_ ; stretch ; tile)
             renaming (  map to fmap
                      ; none to noneT )
open PTM     using    (Media ; some ; none ; _:+:_ ; _:=:_)
open Rhy     using    ( Rhythm ; repeat
                      ; _⸲_ ; ⟦_∥_ ; ⟦ph_⸲_∥_ ; ⇐_/_⇐_ ; ⇒_/_⇒_
                      ) public
             using    ( sequence ; u↑l )
             renaming ( eval to evalR )
open Pat     using    ( Pattern ; ⟨_⟩_ ; o_ ; -_ ; ⟧ ) public
             using    ( phrase )
open Fin     using    ( Fin )
             renaming ( zero     to zero'
                      ; suc      to suc' )
open Dec     using    ( False ; True ; fromWitness ; toWitness)
open Nat     using    ( ℕ ; _+_ ; _*_ ; suc; zero)
open Int     using    ( ℤ ; +_  ; _-_ ; ∣_∣ ; _⊖_ )
open Rat     using    ( ℚ ; normalize )
open NatProp using    ( _≟_ ; *-comm )
open String  renaming ( String to Name )
open Eq      using    ( _≡_ ; sym )
open LCM     using    ( lcm ; lcm-comm )

data ⊥'tsh : (n d : ℕ) → Set where
  voice_begin_end : {n : ℕ} → {d : ℕ} → {d≢0 : d ≢0}
                  → (name : Name) → Rhythm (Fin 16) n d → ⊥'tsh n d
  sim : {n d : ℕ}
      → ⊥'tsh n d
      → ⊥'tsh n d
      → ⊥'tsh n d
  seq : {n₁ d : ℕ} → {n₂ : ℕ}
      → ⊥'tsh n₁        d
      → ⊥'tsh n₂        d
      → ⊥'tsh (n₁ + n₂) d
  loop : (m : ℕ) → {n d : ℕ} → ⊥'tsh n d → ⊥'tsh (m * n) d

data Sample : Set where
  sample : (file : Name) → (volume : Fin 16) → Sample

private
  PTM2Audio : {n : ℕ} → (d : ℕ) → Media Sample n → SampleAudio
  PTM2Audio d (none n)              = rest (q (+ n) (+ d))
  PTM2Audio d (some n (sample f v)) = play f (q (+ n) (+ d)) (volume v)
  PTM2Audio d (m₁ :+: m₂)           = PTM2Audio d m₁ ++ PTM2Audio d m₂
  PTM2Audio d (m₁ :=: m₂)           = PTM2Audio d m₁ == PTM2Audio d m₂

  TPTM2Audio : {n d : ℕ} → Tile Sample n d → SampleAudio
  TPTM2Audio (tile _ _ u m) = PTM2Audio u m

mutual
  eval : {n d : ℕ} → {d≢0 : d ≢0} → ⊥'tsh n d → Tile Sample n d
  eval voice name begin rh end = fmap (sample name) (evalR rh)
  eval {d≢0 = d≢0} (sim t₁ t₂) = reset (eval {_}{_}{d≢0} t₁) % (eval {_}{_}{d≢0} t₂)
  eval {d≢0 = d≢0} (seq t₁ t₂) = eval {_}{_}{d≢0} t₁ % eval {_}{_}{d≢0} t₂
  eval {d≢0 = d≢0} (loop  m t) = loop' m d≢0 t

  runGroove : {n d : ℕ} → {d≢0 : d ≢0} → (bpm : ℕ) → ⊥'tsh n d → IO ⊤
  runGroove {d≢0 = d≢0} speed drum-loop =
    runMedia (+ speed) (TPTM2Audio (eval {_}{_}{d≢0} drum-loop))

  private
    loop' : ∀ m {n d} → (d≢0 : d ≢0) → ⊥'tsh n d → Tile Sample (m * n) d
    loop'  zero   {d = d} d≢0 t = noneT 0 d {d≢0}
    loop' (suc m)         d≢0 t = eval {_}{_}{d≢0} t % loop' m d≢0 t

0'_ : {n : ℕ} → Pattern (Fin 16) n → Pattern (Fin 16) (suc n)
1'_ : {n : ℕ} → Pattern (Fin 16) n → Pattern (Fin 16) (suc n)
2'_ : {n : ℕ} → Pattern (Fin 16) n → Pattern (Fin 16) (suc n)
3'_ : {n : ℕ} → Pattern (Fin 16) n → Pattern (Fin 16) (suc n)
4'_ : {n : ℕ} → Pattern (Fin 16) n → Pattern (Fin 16) (suc n)
5'_ : {n : ℕ} → Pattern (Fin 16) n → Pattern (Fin 16) (suc n)
6'_ : {n : ℕ} → Pattern (Fin 16) n → Pattern (Fin 16) (suc n)
7'_ : {n : ℕ} → Pattern (Fin 16) n → Pattern (Fin 16) (suc n)
8'_ : {n : ℕ} → Pattern (Fin 16) n → Pattern (Fin 16) (suc n)
9'_ : {n : ℕ} → Pattern (Fin 16) n → Pattern (Fin 16) (suc n)
a'_ : {n : ℕ} → Pattern (Fin 16) n → Pattern (Fin 16) (suc n)
b'_ : {n : ℕ} → Pattern (Fin 16) n → Pattern (Fin 16) (suc n)
c'_ : {n : ℕ} → Pattern (Fin 16) n → Pattern (Fin 16) (suc n)
d'_ : {n : ℕ} → Pattern (Fin 16) n → Pattern (Fin 16) (suc n)
e'_ : {n : ℕ} → Pattern (Fin 16) n → Pattern (Fin 16) (suc n)
f'_ : {n : ℕ} → Pattern (Fin 16) n → Pattern (Fin 16) (suc n)

0' p = ⟨       zero' {15} ⟩ p
1' p = ⟨ suc' (zero' {14}) ⟩ p
2' p = ⟨ suc' (suc' (zero' {13})) ⟩ p
3' p = ⟨ suc' (suc' (suc' (zero' {12}))) ⟩ p
4' p = ⟨ suc' (suc' (suc' (suc' (zero' {11})))) ⟩ p
5' p = ⟨ suc' (suc' (suc' (suc' (suc' (zero' {10}))))) ⟩ p
6' p = ⟨ suc' (suc' (suc' (suc' (suc' (suc' (zero' {9})))))) ⟩ p
7' p = ⟨ suc' (suc' (suc' (suc' (suc' (suc' (suc' (zero' {8}
       ))))))) ⟩ p
8' p = ⟨ suc' (suc' (suc' (suc' (suc' (suc' (suc' (suc' (zero' {7}
       )))))))) ⟩ p
9' p = ⟨ suc' (suc' (suc' (suc' (suc' (suc' (suc' (suc' (suc' (zero' {6}
       ))))))))) ⟩ p
a' p = ⟨ suc' (suc' (suc' (suc' (suc' (suc' (suc' (suc' (suc' (suc' (zero' {5}
       )))))))))) ⟩ p
b' p = ⟨ suc' (suc' (suc' (suc' (suc' (suc' (suc' (suc' (suc' (suc' (suc' (zero'
       {4}))))))))))) ⟩ p
c' p = ⟨ suc' (suc' (suc' (suc' (suc' (suc' (suc' (suc' (suc' (suc' (suc' (suc'
       (zero' {3})))))))))))) ⟩ p
d' p = ⟨ suc' (suc' (suc' (suc' (suc' (suc' (suc' (suc' (suc' (suc' (suc' (suc'
       (suc' (zero' {2}))))))))))))) ⟩ p
e' p = ⟨ suc' (suc' (suc' (suc' (suc' (suc' (suc' (suc' (suc' (suc' (suc' (suc'
       (suc' (suc' (zero' {1})))))))))))))) ⟩ p
f' p = ⟨ suc' (suc' (suc' (suc' (suc' (suc' (suc' (suc' (suc' (suc' (suc' (suc'
       (suc' (suc' (suc' (zero' {0}))))))))))))))) ⟩ p

private
  u↑ : ∀ n
     → (d : ℕ)
     → (u : ℕ) → {u≢0 : u ≢0}
     → ⊥'tsh n d  → ⊥'tsh (u * n) (u * d)
  u↑ n d u {u≢0} (voice_begin_end {_}{_}{d≢0}name rhythm) =
    voice_begin_end {_}{_}{n≢0∧m≢0→nm≢0 u d u≢0 d≢0} name (u↑l u {u≢0} rhythm)
  u↑ n d u {u≢0} (sim  t₁ t₂) =
    sim (u↑ n d u {u≢0} t₁) (u↑ n d u {u≢0} t₂)
  u↑ .(n₁ + n₂) d u {u≢0} (seq {n₁} {n₂ = n₂} t₁ t₂)
     rewrite NatProp.*-comm u (n₁ + n₂)
           | *-distrib-+ n₁ n₂ u
           | NatProp.*-comm n₁ u
           | NatProp.*-comm n₂ u
           = seq (u↑ n₁ d  u {u≢0} t₁) (u↑ n₂ d u {u≢0} t₂)
  u↑ _ d u {u≢0} (loop m {n} t)
      rewrite sym (NatProp.*-assoc u m n)
            | NatProp.*-comm u m
            | NatProp.*-assoc m u n = loop m (u↑ n d u {u≢0} t)
  sim↑l : (n₁ d₁ d₂ : ℕ) → (d₁≢0 : d₁ ≢0)
      → ⊥'tsh n₁ d₁ → {q≢0 : q₁ d₁ {d₁≢0} d₂ ≢0}
      → ⊥'tsh (q₁ d₁ {d₁≢0} d₂ * n₁) (lcm d₁ d₂)
  sim↑l n₁ d₁ d₂ d₁≢0 t₁ {q≢0}
    rewrite sym (q₁[m,n]*n≡lcm[m,n] d₂ d₁ {d₁≢0})
     = u↑ n₁ d₁ (q₁ d₁ {d₁≢0} d₂) {q≢0} t₁
  sim↑r : (n₂ d₁ d₂ : ℕ) → (d₂≢0 : d₂ ≢0)
      → ⊥'tsh n₂ d₂ → {q≢0 : q₁ d₂ {d₂≢0} d₁ ≢0}
      → ⊥'tsh (q₁ d₂ {d₂≢0} d₁ * n₂) (lcm d₁ d₂)
  sim↑r n₂ d₁ d₂ d₂≢0 t₂ {q≢0}
    rewrite sym (q₁[m,n]*n≡lcm[n,m] d₁ d₂ {d₂≢0})
     = u↑ n₂ d₂ (q₁ d₂ {d₂≢0} d₁) {q≢0} t₂

infixr 4 _،_
_،_ : {n₁ n₂ d₁ d₂ : ℕ} → {d₁≢0 : d₁ ≢0} → {d₂≢0 : d₂ ≢0}
    → {eq : True (n₁ * d₂ ≟ n₂ * d₁)}
    → {q₁≢0 : q₁ d₁ {d₁≢0} d₂ ≢0} → {q₂≢0 : q₁ d₂ {d₂≢0} d₁ ≢0}
    → ⊥'tsh n₁ d₁ → ⊥'tsh n₂ d₂ → ⊥'tsh (q₁ d₂ {d₂≢0} d₁ * n₂) (lcm d₁ d₂)
_،_ {n₁} {n₂} {d₁} {d₂} {d₁≢0} {d₂≢0} {eq} {q₁≢0} {q₂≢0} t₁ t₂
  with sim↑l n₁ d₁ d₂ d₁≢0 t₁ {q₁≢0} | sim↑r n₂ d₁ d₂ d₂≢0 t₂ {q₂≢0}
... | t₁' | t₂'
    rewrite sym (q₁d₁d₂*n₁≡q₂d₂d₁*n₂ n₁ n₂ d₁ d₂ d₁≢0 d₂≢0 (toWitness eq))
          = sim t₁' t₂'

infixr 3 _;_
_;_ : {n₁ n₂ d₁ d₂ : ℕ} → {d₁≢0 : d₁ ≢0} → {d₂≢0 : d₂ ≢0}
    → {q₁≢0 : q₁ d₁ {d₁≢0} d₂ ≢0} → {q₂≢0 : q₁ d₂ {d₂≢0} d₁ ≢0}
    → ⊥'tsh n₁ d₁
    → ⊥'tsh n₂ d₂
    → ⊥'tsh (q₁ d₁ {d₁≢0} d₂ * n₁ + q₁ d₂ {d₂≢0} d₁ * n₂) (lcm d₁ d₂)
_;_ {n₁} {n₂} {d₁} {d₂} {d₁≢0} {d₂≢0} {q₁≢0} {q₂≢0} t₁ t₂
  = seq (sim↑l n₁ d₁ d₂ d₁≢0 t₁ {q₁≢0}) (sim↑r n₂ d₁ d₂ d₂≢0 t₂ {q₂≢0})


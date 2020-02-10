
module Rhythm where

import Pattern                               as Pat
import Data.Nat                              as Nat
import Data.Nat.DivMod                       as NatDiv
import Data.Integer                          as Int
import Relation.Nullary.Decidable            as Dec
import Data.Nat.Properties                   as NatProp
import Relation.Binary.PropositionalEquality as Eq
import Data.Nat.LCM                          as LCM
import Tiled.Polymorphic.Temporal.Media      as TPTM

open import Lemmas
open import NatList

open TPTM    using    ( Tile ; tile ; mediaT ; delay→ ; delay← ; _%_)
             renaming ( none    to noneT
                      ; some    to someT
                      ; stretch to stretchT )
open Pat     using    ( Pattern ; ⟨_⟩_ ; o_ ; -_ ; ⟧
                      ; phrase )
             renaming (     none to noneP
                      ;  stretch to stretchP
                      ;     eval to evalP
                      )
open Nat     using    ( ℕ ; zero ; suc ; _+_ ; _*_ )
open LCM     using    ( lcm )
open Int     using    ( ℤ )
             renaming ( _+_ to _⊕_ ; _*_ to _⊛_ )
open Dec     using    ( True; False )
open NatProp using    ( _≟_ ; *-comm ; *-assoc ; +-assoc )
open Eq      using    ( _≡_ ; refl ; sym )
open NatDiv  using    ( _/_ )

data Rhythm (A : Set) : (n d : ℕ) → Set where
  ⟦_∥_     : {n : ℕ}
           → (d : ℕ) → {d≢0 : d ≢0}
           → Pattern A n
           → Rhythm A n d
  ⟦ph_⸲_∥_  : {n : ℕ}
           → {m : ℕ}→ {m≢0 : m ≢0}
           → NatList n m
           → (d : ℕ) → {d≢0 : d ≢0}
           → Pattern A n → Rhythm A (m * n) (m * d)
  ahead    : {n : ℕ}
           → {d : ℕ}
           → (t : ℕ)
           → Rhythm A n d → Rhythm A (n) (d)
  behind   : {n : ℕ}
           → {d : ℕ}
           → (t : ℕ)
           →  Rhythm A n d → Rhythm A (n) (d)
  sequence : {n m d : ℕ}
           → Rhythm A n d → Rhythm A m d → Rhythm A (n + m) d
  repeat   : {n : ℕ}
           → {d : ℕ} → {d≢0 : d ≢0}
           → (t : ℕ)
           → Rhythm A n d → Rhythm A (n * t) d

none : {A : Set}(n d : ℕ) → {d≢0 : d ≢0} → Rhythm A n d
none n (suc d) {d≢0} = ⟦_∥_ (suc d) {d≢0} (noneP n)

stretch : {A : Set} → {n d : ℕ} → (k : ℕ) → Rhythm A n d → Rhythm A (k * n) d
stretch k (⟦_∥_     d {d≢0} p) = ⟦_∥_ d {d≢0} (stretchP k p)
stretch k (⟦ph_⸲_∥_ {n} {m} {m≢0} t d {d≢0} p)
        = ⟦_∥_ (m * d) {n≢0∧m≢0→nm≢0 m d m≢0 d≢0}
          (stretchP k (phrase (stretchNL n t) p))
stretch k (sequence {n} {m} r₁ r₂)
  rewrite *-comm k (n + m)
        | *-distrib-+ n m k
        | *-comm n k
        | *-comm m k
        = sequence (stretch k r₁) (stretch k r₂)
stretch k (ahead  t r) = ahead  t (stretch k r)
stretch k (behind t r) = behind t (stretch k r)
stretch k (repeat {n} {d} {d≢0} t r)
  rewrite sym (*-assoc k n t)
        = repeat {_} {_} {_} {d≢0} t (stretch k r)

u↑l : {A : Set}{n d : ℕ}(u : ℕ){u≢0 : (u ≢0)} → Rhythm A n d → Rhythm A (u * n) (u * d)
u↑l u {u≢0} (⟦_∥_ d {d≢0} p) = stretch u (⟦_∥_ (u * d) {n≢0∧m≢0→nm≢0 u d u≢0 d≢0} p)
u↑l u {u≢0} (⟦ph_⸲_∥_ {n} {m} {m≢0} t d {d≢0} p)
  with n≢0∧m≢0→nm≢0 u (m * d) u≢0 (n≢0∧m≢0→nm≢0 m d m≢0 d≢0)
... | umd≢0 = stretch u (⟦_∥_ (u * (m * d)) {umd≢0} (phrase (stretchNL n t) p))
u↑l u {u≢0} (ahead t r)  = ahead  t (u↑l u {u≢0} r)
u↑l u {u≢0} (behind t r) = behind t (u↑l u {u≢0} r)
u↑l u {u≢0}(sequence {n} {m} r r₁)
  rewrite *-comm u (n + m)
        | *-distrib-+ n m u
        | *-comm n u
        | *-comm m u
        = sequence (u↑l u {u≢0} r) (u↑l u {u≢0} r₁)
u↑l u {u≢0} (repeat {n}{d}{d≢0} t r)
  rewrite sym (*-assoc u n t)
        = repeat {_}{_}{u * d}{n≢0∧m≢0→nm≢0 u d u≢0 d≢0} t (u↑l u {u≢0} r)

u↑r : {A : Set}{n d : ℕ}(u : ℕ){u≢0 : (u ≢0)} →
      Rhythm A n d → Rhythm A (u * n) (d * u)
u↑r {d = d} u {u≢0} r rewrite *-comm d u = u↑l u {u≢0} r

⇐_/_⇐_ : {A : Set}{n d : ℕ}{d≢0 : d ≢0} (t u : ℕ) {u≢0 : u ≢0}
       → Rhythm A n d →  Rhythm A (q₁ d {d≢0} u * n) (q₁ d {d≢0} u * d)
⇐_/_⇐_ {_}{n}{d} {d≢0} t u {u≢0} r =
  u↑l (q₁ d {d≢0} u) {n≢0∧m≢0→q[lcm[n,m]]≢0 d u d≢0 u≢0} (ahead (q₁ u {u≢0} d * t) r)

⇒_/_⇒_ : {A : Set}{n d : ℕ}{d≢0 : d ≢0} (t u : ℕ) {u≢0 : u ≢0}
       → Rhythm A n d →  Rhythm A (q₁ d {d≢0} u * n) (q₁ d {d≢0} u * d)
⇒_/_⇒_ {_}{n}{d} {d≢0} t u {u≢0} r =
  u↑l (q₁ d {d≢0} u) {n≢0∧m≢0→q[lcm[n,m]]≢0 d u d≢0 u≢0} (behind (q₁ u {u≢0} d * t) r)


↑u₁ : {A : Set}{n d : ℕ} → (u : ℕ) → {u ≢0} → {d≢0 : d ≢0}
    → Rhythm A n d → Rhythm A (q₁ d {d≢0} u * n) (lcm d u)
↑u₁ u {u≢0} (⟦_∥_     d {d≢0} p) =
  ⟦_∥_ (lcm d u) {n≢0∧m≢0→lcm[n,m]≢0 d u d≢0 u≢0} (stretchP (q₁ d {d≢0} u) p)
↑u₁ u {u≢0} (⟦ph_⸲_∥_ {n}{m}{m≢0} t d {d≢0} p) =
  ⟦_∥_ (lcm (m * d) u) {n≢0∧m≢0→lcm[n,m]≢0 (m * d) u (n≢0∧m≢0→nm≢0 m d m≢0 d≢0) u≢0}
    (stretchP (q₁ (m * d) {n≢0∧m≢0→nm≢0 m d m≢0 d≢0} u) (phrase (stretchNL n t) p))
↑u₁ {d = d} u {u≢0} {d≢0} (sequence {n} {m} r₁ r₂)
  rewrite *-comm (q₁ d {d≢0} u) (n + m)
        | *-distrib-+ n m (q₁ d {d≢0} u)
        | *-comm n (q₁ d {d≢0} u)
        | *-comm m (q₁ d {d≢0} u)
        = sequence (↑u₁ u {u≢0} {d≢0} r₁) (↑u₁ u {u≢0} {d≢0} r₂)
↑u₁ {d = d} u {u≢0} {d≢0} (ahead  t r) = ahead  (q₁ d {d≢0} u * t) (↑u₁ u {u≢0} {d≢0} r)
↑u₁ {d = d} u {u≢0} {d≢0} (behind t r) = behind (q₁ d {d≢0} u * t) (↑u₁ u {u≢0} {d≢0} r)
↑u₁ {d = d} u {u≢0} {d≢0} (repeat {n} t r)
  rewrite sym (*-assoc (q₁ d {d≢0} u) n t)
        = repeat {_}{_}{_}{n≢0∧m≢0→lcm[n,m]≢0 d u d≢0 u≢0} t (↑u₁ u {u≢0}{d≢0} r)

↑u₁← : {A : Set}{n d : ℕ}(u : ℕ) → {u≢0 : False (u ≟ 0)} → {d≢0 : False (d ≟ 0)}
     → Rhythm A n d → Rhythm A (n * q₁ d {d≢0} u) (lcm d u)
↑u₁← {n = n} {d} u {u≢0} {d≢0} r
  rewrite *-comm n (q₁ d {d≢0} u)
        = ↑u₁ u {u≢0} {d≢0} r

↑d₂ : {A : Set}{n u : ℕ}(d : ℕ) → {d ≢0} → {u≢0 : u ≢0}
    → Rhythm A n u → Rhythm A (q₁ u {u≢0} d * n) (lcm u d)
↑d₂ d {d≢0} (⟦_∥_     u {u≢0} p) =
  ⟦_∥_ (lcm u d) {n≢0∧m≢0→lcm[n,m]≢0 u d u≢0 d≢0} (stretchP (q₁ u {u≢0} d) p)
↑d₂ d {d≢0} (⟦ph_⸲_∥_ {n}{m}{m≢0} t u {u≢0} p) =
  ⟦_∥_ (lcm (m * u) d) {n≢0∧m≢0→lcm[n,m]≢0 (m * u) d (n≢0∧m≢0→nm≢0 m u m≢0 u≢0) d≢0}
    (stretchP (q₁ (m * u) {n≢0∧m≢0→nm≢0 m u m≢0 u≢0} d) (phrase (stretchNL n t) p))
↑d₂ {u = u} d {d≢0} {u≢0} (sequence {n} {m} r₁ r₂)
  rewrite *-comm (q₁ u {u≢0} d) (n + m)
        | *-distrib-+ n m (q₁ u {u≢0} d)
        | *-comm n (q₁ u {u≢0} d)
        | *-comm m (q₁ u {u≢0} d)
        = sequence (↑d₂ d {d≢0}{u≢0} r₁) (↑d₂ d {d≢0}{u≢0} r₂)
↑d₂ {u = u} d {d≢0}{u≢0} (ahead  t r) = ahead  (q₁ u {u≢0} d * t) (↑d₂ d {d≢0}{u≢0} r)
↑d₂ {u = u} d {d≢0}{u≢0} (behind t r) = behind (q₁ u {u≢0} d * t) (↑d₂ d {d≢0}{u≢0} r)
↑d₂ {u = u} d {d≢0}{u≢0} (repeat {n} t r)
  rewrite sym (*-assoc (q₁ u {u≢0} d) n t)
        = repeat {_}{_}{_}{ n≢0∧m≢0→lcm[n,m]≢0 u d u≢0 d≢0} t (↑d₂ d {d≢0}{u≢0} r)

↑d₂← : {A : Set}{n d : ℕ}(u : ℕ) → {u≢0 : False (u ≟ 0)} → {d≢0 : False (d ≟ 0)}
     → Rhythm A n d → Rhythm A (n * q₁ d {d≢0} u) (lcm u d)
↑d₂← {n = n} {d} u {u≢0}{d≢0} r
  rewrite *-comm n (q₁ d {d≢0} u)
        | LCM.lcm-comm u d = ↑d₂ u {u≢0}{d≢0} r

infixr 3 _⸲_
_⸲_ : {A : Set}{n m d₁ : ℕ} → {d₁≢0 : d₁ ≢0} {d₂ : ℕ} → {d₂≢0 : d₂ ≢0}
    →                        Rhythm A n d₁ → Rhythm A m d₂
    →                 Rhythm A ((n * q₁ d₁ {d₁≢0} d₂) + (m * q₁ d₂ {d₂≢0} d₁)) (lcm d₁ d₂)
_⸲_ {_}{n} {m} {d₁}{d₁≢0}{d₂}{d₂≢0} r₁ r₂ = sequence (↑u₁← d₂ {d₂≢0}{d₁≢0} r₁) (↑d₂← d₁ {d₁≢0}{d₂≢0} r₂)

example : Rhythm ℕ 6 16
example = ⇐ 1 / 16 ⇐ ⟦  8 ∥ ⟨ 0 ⟩ o ⟧ ⸲ ⇒ 1 /  8 ⇒ ⟦ 16 ∥ ⟨ 0 ⟩ o ⟧


mutual
  eval : {A : Set} {n : ℕ} {d : ℕ} → Rhythm A n d → Tile A n d
  eval (⟦_∥_ d {d≢0} p) = mediaT (evalP p) d {d≢0}
  eval (⟦ph_⸲_∥_ {n} {m} {m≢0} t d {d≢0} p)
    rewrite NatProp.*-comm m n
    = mediaT (evalP (stretchP n (phrase t p))) (m * d) {n≢0∧m≢0→nm≢0 m d m≢0 d≢0}
  eval (ahead    t  r ) = delay← t (eval r)
  eval (behind   t  r ) = delay→ t (eval r)
  eval (sequence r₁ r₂) = eval r₁ % eval r₂
  eval (repeat {d = d}{d≢0} t r) = repeat' {d = d}{d≢0} t r

  repeat' : {A : Set} {n : ℕ} {d : ℕ} → {d ≢0} → (t : ℕ) → Rhythm A n d → Tile A (n * t) d
  repeat'  {n = n}{d} {d≢0} zero r
    rewrite NatProp.*-comm n 0 = noneT 0 d {d≢0}
  repeat' {n = n} {d} {d≢0} (suc t) r
    rewrite NatProp.*-comm n (suc t)
          | NatProp.*-comm t n = eval r % (repeat' {d = d} {d≢0} t r)

{-# LANGUAGE DataKinds
           , GADTs
           , KindSignatures
           , TypeFamilies
           , TypeOperators
           , UndecidableInstances
           , NoImplicitPrelude
           , TypeSynonymInstances
  #-}

module Lib.Nat where

import Lib.Singleton

-- For convinience, we define the first 16 Nats as follows:
type I    = Suc Zero
type II   = Suc I
type III  = Suc II
type IV   = Suc III
type V    = Suc IV
type VI   = Suc V
type VII  = Suc VI
type VIII = Suc VII
type IX   = Suc VIII
type X    = Suc IX
type XI   = Suc X
type XII  = Suc XI
type XIII = Suc XII
type XIV  = Suc XIII
type XV   = Suc XIV
type XVI  = Suc XV

i    = S O
ii   = S i
iii  = S ii
iv   = S iii
v    = S iv
vi   = S v
vii  = S vi
viii = S vii
ix   = S viii
x    = S ix
xi   = S x
xii  = S xi
xiii = S xii
xiv  = S xiii
xv   = S xiv
xvi  = S xv

data Nat :: * where
  Zero :: Nat
  Suc  :: Nat -> Nat

data instance Singleton :: Nat -> * where
  O :: Singleton Zero
  S :: Singleton n -> Singleton (Suc n)

type SNat (n :: Nat) = Singleton n

-- Addition
infixl 5 +, :+, %+
(+) :: Nat -> Nat -> Nat
Zero    + m = m
(Suc n) + m = Suc (n + m)

type family (n :: Nat) :+ (m :: Nat) :: Nat where
  Zero    :+ n = n
  (Suc n) :+ m = Suc (n :+ m)

(%+) :: SNat n -> SNat m -> SNat (n :+ m)
O     %+ n = n
(S n) %+ m = S (n %+ m)

-- Multiplication
infixl 6 *, :*, %*
(*) :: Nat -> Nat -> Nat
Zero    * m = Zero
(Suc n) * m = m + (n * m)

type family (n :: Nat) :* (m :: Nat) :: Nat where
  Zero    :* _ = Zero
  (Suc n) :* m = m :+ (n :* m)

(%*) :: SNat n -> SNat m -> SNat (n :* m)
O     %* n = O
(S n) %* m = m %+ (n %* m)

-- Max
max :: Nat -> Nat -> Nat
max Zero     m      = m
max n        Zero   = n
max (Suc n) (Suc m) = Suc (max n m)

type family (n :: Nat) `Max` (m :: Nat) :: Nat where
  Zero    `Max`      m  = m
  n       `Max`  Zero   = n
  (Suc n) `Max` (Suc m) = Suc (n `Max` m)

sMax :: SNat n -> SNat m -> SNat (n `Max` m)
sMax O      m    = m
sMax n      O    = n
sMax (S n) (S m) = S (sMax n m)

-- Min
min :: Nat -> Nat -> Nat
min Zero _ = Zero
min _ Zero = Zero
min (Suc n) (Suc m) = Suc (min n m)

type family (n :: Nat) `Min` (m :: Nat) :: Nat where
  Zero    `Min`      _  = Zero
  n       `Min`  Zero   = Zero
  (Suc n) `Min` (Suc m) = Suc (n `Min` m)

sMin :: SNat n -> SNat m -> SNat (n `Min` m)
sMin O      _    = O
sMin _      O    = O
sMin (S n) (S m) = S (sMin n m)

(-) :: Nat -> Nat -> Nat
n       -  Zero   = n
Zero    - (Suc _) = Zero
(Suc n) - (Suc m) = n - m

type family (n :: Nat) :- (m :: Nat) :: Nat where
  n    :- Zero = n
  Zero :- (Suc _) = Zero
  (Suc n) :- (Suc m) = n :- m

(%-) :: SNat n -> SNat m -> SNat (n :- m)
n     %-  O    = n
O     %- (S _) = O
(S n) %- (S m) = n %- m

-- Modulo (Inspired by agda-stdlib).

-- By induction on `n` where :
-- n = k + l ==> mod-helper k n m l = (m + k) nod (1 + n).

mod_helper :: Nat -> Nat -> Nat -> Nat -> Nat
mod_helper k _  Zero     _    = k
mod_helper k n (Suc m)  Zero   = mod_helper Zero n m n
mod_helper k n (Suc m) (Suc l) = mod_helper (Suc k) n m l

mod :: Nat -> Nat -> Nat
n `mod` m = mod_helper Zero m n m

type family ModHelper (k :: Nat) (n :: Nat) (m :: Nat) (l :: Nat) :: Nat where
  ModHelper k _  Zero     _     = k
  ModHelper k n (Suc m)  Zero   = ModHelper Zero n m n
  ModHelper k n (Suc m) (Suc l) = ModHelper (Suc k) n m l

type family (n :: Nat) `Mod` (m :: Nat) :: Nat where
  n `Mod` m = ModHelper Zero m n m

sMod_helper :: SNat k -> SNat n -> SNat m -> SNat l -> SNat (ModHelper k n m l)
sMod_helper k _  O     _    = k
sMod_helper k n (S m)  O    = sMod_helper  O n m n
sMod_helper k n (S m) (S l) = sMod_helper (S k) n m l

sMod :: SNat n -> SNat m -> SNat (n `Mod` m)
n `sMod` m = sMod_helper O m n m

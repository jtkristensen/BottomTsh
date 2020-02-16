{-# LANGUAGE DataKinds
           , GADTs
           , KindSignatures
           , TypeFamilies
           , TypeOperators
           , NoImplicitPrelude
           , PolyKinds
  #-}

module Lib.Nat.Compare where

import Lib.Nat
import Lib.Reasoning
import Data.Void (Void, absurd)

data Leq :: Nat -> Nat -> * where
  ZLeqN :: SNat n     -> Zero `Leq` n
  SLeqS :: n `Leq` m  -> (Suc n) `Leq` (Suc m)

leqFst :: Leq n m -> SNat n
leqFst (ZLeqN _) = O
leqFst (SLeqS p) = S (leqFst p)

leqSnd :: Leq n m -> SNat m
leqSnd (ZLeqN n) = n
leqSnd (SLeqS p) = S (leqSnd p)

data DecideLeq :: Nat -> Nat -> * where
  YesLeq :: n `Leq` m -> DecideLeq n m
  NoLeq  :: m `Le`  n -> DecideLeq n m

-- if   n <= m
-- then yes (proof of n <= m)
-- else no  (proof of m <  n)
decideLeq :: SNat n -> SNat m -> DecideLeq n m
decideLeq O         m = YesLeq (ZLeqN m)
decideLeq (S n) O     = NoLeq  (ZLeS  n)
decideLeq (S n) (S m) =
  case decideLeq n m of
    YesLeq p -> YesLeq (SLeqS p)
    NoLeq  p -> NoLeq  (SLeS  p)

data Le :: Nat -> Nat -> * where
  ZLeS  :: SNat n   -> Zero    `Le` (Suc n)
  SLeS  :: n `Le` m -> (Suc n) `Le` (Suc m)

leFst :: Le n m -> SNat n
leFst (ZLeS _) = O
leFst (SLeS p) = S (leFst p)

leSnd :: Le n m -> SNat m
leSnd (ZLeS n) = (S n)
leSnd (SLeS p) = S (leSnd p)

data DecideLe :: Nat -> Nat -> * where
  YesLe :: n `Le`  m -> DecideLe n m
  NoLe  :: m `Leq` n -> DecideLe n m

decideLe :: SNat n -> SNat m -> DecideLe n m
decideLe n m =
  case decideLeq m n of
    YesLeq p -> NoLe  p
    NoLeq  p -> YesLe p

type Geq n m = Leq m n
type Ge  n m = Leq m n

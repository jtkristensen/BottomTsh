{-# LANGUAGE DataKinds
           , GADTs
           , KindSignatures
           , TypeOperators
  #-}

module Lib.Fin where

import Lib.Nat         hiding ((+))
import Lib.Nat.Compare

data Fin :: Nat -> * where
  FZero :: SNat n -> Fin (Suc n)
  FSuc  :: Fin  n -> Fin (Suc n)

fin2nat :: Fin f -> Nat
fin2nat (FZero f) = Zero
fin2nat (FSuc  f) = Suc (fin2nat f)


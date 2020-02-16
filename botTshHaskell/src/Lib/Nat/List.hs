{-# LANGUAGE DataKinds
           , GADTs
           , KindSignatures
           , TypeOperators
           , NoImplicitPrelude
  #-}

module Lib.Nat.List where

import Lib.Nat
import Lib.Nat.Properties
import Lib.Reasoning
import Lib.Singleton

data NatList (len :: Nat) (sum :: Nat) :: * where
  Nil   :: NatList Zero Zero
  (:::) :: SNat n -> NatList l m -> NatList (Suc l) (n :+ m)

length :: NatList l s -> SNat l
length    Nil     = O
length (_ ::: ns) = S (length ns)

sum :: NatList l s -> SNat s
sum    Nil     = O
sum (n ::: ns) = n %+ sum ns

stretchNL :: SNat m -> NatList l s -> NatList l (s :* m)
stretchNL _    Nil     = Nil
stretchNL m (n ::: ns) =
     multDistribPlus n (sum ns) m
  %| (n %* m) ::: stretchNL m ns

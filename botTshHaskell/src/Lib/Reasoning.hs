{-# LANGUAGE DataKinds
           , TypeFamilies
           , TypeOperators
           , GADTs
           , NoImplicitPrelude
           , RankNTypes
           , PolyKinds
  #-}

module Lib.Reasoning where

import Lib.Singleton
import Lib.Nat

infix 3 :==:

data a :==: b :: * where
  Refl :: a :==: a

eqSym :: a :==: b -> b :==: a
eqSym Refl = Refl

eqCong :: (Singleton a -> Singleton b) -> (a :==: c) -> (f a :==: f c)
eqCong _ Refl = Refl

eqTrans :: (a :==: b) -> (b :==: c) -> a :==: c
eqTrans Refl Refl = Refl

infixr 1 %|
(%|) :: (a :==: b) -> ((a ~ b) => r) -> r
(%|) Refl x = x

qed :: a :==: a
qed = Refl

refl :: a :==: a
refl = Refl

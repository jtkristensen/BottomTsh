{-# LANGUAGE DeriveDataTypeable
           , DataKinds
           , GADTs
           , KindSignatures
           , TypeOperators
  #-}

module Tiled.Polymorphic.Temporal.Media where

import Lib.Nat
import Lib.Nat.Compare
import Lib.Nat.Properties
import Lib.Reasoning
import Polymorphic.Temporal.Media

data Tile :: Nat -> Nat -> * -> * where
  Tile :: Leq pre post -> SNat unit -> Media n a
       ->        Tile (post :- pre) u a

instance Functor (Tile n u) where
  fmap f (Tile leq u m) = Tile leq u (fmap f m)

noneT :: SNat n -> SNat u -> Tile n u a
noneT n u = Tile (ZLeqN n) u (None n)

someT :: a -> SNat n -> SNat u -> Tile n u a
someT a n u = Tile (ZLeqN n) u (Some n a)

mediaT :: Media n a -> SNat u -> Tile n u a
mediaT m u = Tile (ZLeqN $ durM m) u m

stepsT :: Tile n u a -> SNat n
stepsT (Tile p _ _) = leqSnd p %- leqFst p

stretchT :: SNat k -> Tile n u a -> Tile (k :* n) u a
stretchT k (Tile leq u m) =
     multComm k (leqSnd leq %- leqFst leq)
  %| multDistMinus leq k
  %| Tile (leqMonoMult leq k) u (stretchM k m)

delayTl :: SNat k -> Tile n u a -> Tile n u a
delayTl k (Tile leq u m) =
     plusDistMinus leq k
  %| Tile (leqMonoPlus leq k) u m

delayTr :: SNat k -> Tile n u a -> Tile n u a
delayTr k (Tile leq u m) = Tile leq u (delayML k m)

reset :: Tile n u a -> Tile Zero u a
reset (Tile leq u m) =
  let pre = leqFst leq
  in  minusSelf pre
  %|  Tile (leqReflexive pre) u m

coReset :: Tile n u a -> Tile Zero u a
coReset (Tile leq u m) =
  let post = leqSnd leq
  in  minusSelf post
  %|  Tile (leqReflexive post) u m

-- No rule for inverse.

(%) :: Tile n1 u a -> Tile n2 u a -> Tile (n1 :+ n2) u a
(Tile leq1 u m1) % t2@(Tile leq2 _ m2) =
  leqMinusPlusAssoc leq1 leq2
  %| case decideLeq post1 pre2 of
       YesLeq _ ->
         Tile (leqMono leq1 (stepsT t2)) u
              (delayML (post1 %- pre2) m1 |=| m2)
       NoLeq  _ ->
         Tile (leqMono leq1 (stepsT t2)) u
              (m1 |=| (delayML (pre2 %- post1) m2))
  where
     pre1  = leqFst leq1
     post1 = leqSnd leq1
     pre2  = leqFst leq2
     post2 = leqSnd leq2

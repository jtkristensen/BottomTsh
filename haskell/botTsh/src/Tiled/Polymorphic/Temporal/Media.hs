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
  Tile :: pre `Leq` post -> SNat unit -> Media n a
       ->        Tile (post :- pre) unit a

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

-- Tiled Product

lemma1l :: SNat k -> pr1 `Leq` po1 -> pr2 `Leq` po2
        -> (po1 :- pr1) :+ (po2 :- pr2) :==: ((po1 :+ k) :- (pr1 :+ k)) :+ (po2 :- pr2)
lemma1l k leq1 leq2 = plusInjective (po2 %- pr2) (minusIdPlus po1 pr1 k)
  where (pr1, po1) = (leqFst leq1, leqSnd leq1)
        (pr2, po2) = (leqFst leq2, leqSnd leq2)

lemma1r :: SNat k -> pr1 `Leq` po1 -> pr2 `Leq` po2
        -> (po1 :- pr1) :+ (po2 :- pr2) :==: (po1 :- pr1) :+ ((po2 :+ k) :- (pr2 :+ k))
lemma1r k leq1 leq2 =
     plusComm (po1 %- pr1) (po2 %- pr2)
  %| lemma1l k leq2 leq1
  %| plusComm ((po2 %+ k) %- (pr2 %+ k)) (po1 %- pr1)
  where (pr1, po1) = (leqFst leq1, leqSnd leq1)
        (pr2, po2) = (leqFst leq2, leqSnd leq2)

lemma2l :: pr1 `Leq` po1 -> pr2 `Leq` po2 -> pr2 `Leq` po1
        -> (po1 :- pr1) :+ (po2 :- pr2) :==: (po2 :+ (po1 :- pr2)) :- pr1
lemma2l leq1 leq2 leq3 =
      minusAssocR2 (leqSnd leq2 %- leqFst leq2) leq1
  %|  minusAssocL2 leq3 leq2
  %|  refl

lemma2r :: pr1 `Leq` po1 -> pr2 `Leq` po2 -> pr2 `Leq` po1
        -> pr1 `Leq` (po2 :+ (po1 :- pr2))
lemma2r leq1 leq2 leq3 =
     minusAssocL2 leq2 leq3
  %| leqSteps leq1 (leqSnd leq2 %- leqFst leq2)

(%) :: Tile n1 u a -> Tile n2 u a -> Tile (n1 :+ n2) u a
(Tile leq1 u m1) % t2@(Tile leq2 _ m2) =
  case decideLeq pre2 post1 of
    (YesLeq pre2LeqPost1) ->
      let d = post1 %- pre2
      in lemma2l leq1 leq2 pre2LeqPost1
      %| Tile (lemma2r leq1 leq2 pre2LeqPost1) u (m1 |=| delayML d m2)
    (NoLeq  post1LePre2 ) ->
      let d    = pre2 %- post1
          leq3 = (leqMonoPlus leq1 d)
          leq4 = (eqWeakenLeq (distanceLemma post1LePre2) pre2)
      in plusComm (post1 %- pre1) (post2 %- pre2)
      %| lemma1r d leq2 leq1
      %| plusComm (post2 %- pre2) ((post1 %+ d) %- (pre1 %+ d))
      %| lemma2l leq3 leq2 leq4
      %| Tile (lemma2r leq3 leq2 leq4) u (delayML d m1 |=| m2)
  where
     pre1  = leqFst leq1
     post1 = leqSnd leq1
     pre2  = leqFst leq2
     post2 = leqSnd leq2

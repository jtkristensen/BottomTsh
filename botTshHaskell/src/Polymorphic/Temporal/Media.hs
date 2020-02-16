{-# LANGUAGE GADTs
           , DataKinds
           , KindSignatures
           , PolyKinds
           , TypeOperators
           , TypeFamilies
  #-}

module Polymorphic.Temporal.Media where

import Lib.Nat
import Lib.Nat.Properties
import Lib.Reasoning
import Lib.Singleton
import Lib.Nat.Compare

data Media :: Nat -> * -> * where
  None  :: SNat n    ->              Media  n          a
  Some  :: SNat n    -> a         -> Media  n          a
  (:+:) :: Media n a -> Media m a -> Media (n :+ m)    a
  (:=:) :: Media n a -> Media n a -> Media  n          a

instance Functor (Media n) where
  fmap f (None n    ) = None n
  fmap f (Some n a  ) = Some n (f a)
  fmap f (m1 :+:  m2) = fmap f m1 :+: fmap f m2
  fmap f (m1 :=: m2) = fmap f m1 :=: fmap f m2

delayML :: SNat n -> Media m a -> Media (n :+ m) a
delayML n m = None n :+: m

delayMR :: SNat n -> Media m a -> Media (m :+ n) a
delayMR n m = m :+: None n

durM :: Media n a -> SNat n
durM (None n   ) = n
durM (Some n _ ) = n
durM (m1 :+: m2) = durM m1 %+ durM m2
durM (m1 :=: m2) = durM m1

stretchM :: SNat n -> Media m a -> Media (m :* n) a
stretchM n (None m)    = None (m %* n)
stretchM n (Some m a)  = Some (m %* n) a
stretchM n (m1 :+: m2) =
     multDistribPlus (durM m1) (durM m2) n
  %| stretchM n m1 :+: stretchM n m2
stretchM n (m1 :=: m2) = stretchM n m1 :=: stretchM n m2

(|=|) :: Media d1 a -> Media d2 a -> Media (d1 `Max` d2) a
m1 |=| m2 = short m1 m2 :=: long m1 m2
  where
    d1 = durM m1
    d2 = durM m2
    short m1 m2 =
       case decideLeq d1 d2 of
         YesLeq p -> eqSym          (leqMaxR' p) %| delayMR (d2 %- d1) m1
         NoLeq  p -> maxComm d1 d2 %| leMaxR' p  %| delayMR (d1 %- d2) m2
    long  m1 m2 =
      case decideLeq (durM m1) (durM m2) of
        YesLeq p ->                   leqMaxR p  %| m2
        NoLeq  p ->  maxComm d1 d2 %| leMaxR  p  %| m1

tie :: Media n a -> Media m a -> Media (n :+ m) a
tie (None n) (None m   )    = None (n %+ m)
tie (None n) (Some m a )    = None n :+: Some m a
tie (None n) (m1 :+:  m2)   =
     plusAssoc n (durM m1) (durM m2)
  %| None n `tie` m1 :+: m2
tie (None n) (m1 :=: m2)    = (None n `tie` m1) :=: (None n `tie` m2)
tie (Some n a) (None m)     = Some (n %+ m) a
tie (Some n a) (Some m b)   = Some n a :+: Some m b
tie (Some n a) (m1 :+: m2)  =
     plusAssoc n (durM m1) (durM m2)
  %| Some n a `tie` m1 :+: m2
tie (Some n a) (m1 :=: m2)  = (Some n a) :+: (m1 :=: m2)
tie (m1 :+:  m2) m3         =
     eqSym (plusAssoc (durM m1) (durM m2) (durM m3))
  %| m1 :+: (m2 `tie` m3)
tie (m1 :=: m2) m3          = undefined

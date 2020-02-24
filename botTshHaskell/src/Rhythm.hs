{-# LANGUAGE DataKinds
           , GADTs
           , KindSignatures
           , TypeOperators
  #-}

module Rhythm where

import Prelude (Functor(..), undefined)

import Lib.Nat
import Lib.Nat.Properties
import Lib.Nat.List
import Lib.Reasoning

import Pattern
import Tiled.Polymorphic.Temporal.Media


data Rhythm :: Nat -> Nat -> * -> * where
  Tuplet     ::    SNat d -> Pattern n a
            ->       Rhythm n d a
  Phrase    ::    NatList n s -> SNat d -> Pattern n a
            ->        Rhythm (s :* n) (s :* d) a
  Ahead     ::    SNat m -> Rhythm n d a
            ->        Rhythm n d a
  Behind    ::    SNat m -> Rhythm n d a
            ->       Rhythm n d a
  Sequence  ::    Rhythm n d a -> Rhythm m d a
            ->        Rhythm (n :+ m) d a
  Repeat    ::    SNat m -> Rhythm n d a
            ->      Rhythm (n :* m) d a

instance Functor (Rhythm n d) where
  fmap f (Tuplet d p)     = Tuplet d (fmap f p)
  fmap f (Phrase ns d p)  = Phrase ns d (fmap f p)
  fmap f (Ahead m r)      = Ahead m (fmap f r)
  fmap f (Behind m r)     = Behind m (fmap f r)
  fmap f (Sequence r1 r2) = Sequence (fmap f r1) (fmap f r2)
  fmap f (Repeat m r )    = Repeat m (fmap f r)

noneR :: SNat n -> SNat d -> Rhythm n d a
noneR n d = Tuplet d (noneP n)

stepsR :: Rhythm n d a -> SNat n
stepsR (Tuplet  _   p ) = durP p
stepsR (Phrase ns d p ) = sum ns %* durP p
stepsR (Ahead  _    r ) = stepsR r
stepsR (Behind _    r ) = stepsR r
stepsR (Sequence r1 r2) = stepsR r1 %+ stepsR r2
stepsR (Repeat   m  r ) = stepsR r %* m

gridR :: Rhythm n d a -> SNat d
gridR (Tuplet    d _) = d
gridR (Phrase ns d _) = (sum ns %* d)
gridR (Ahead     _ r) = gridR r
gridR (Behind    _ r) = gridR r
gridR (Sequence r1 _) = gridR r1
gridR (Repeat    _ r) = gridR r

stretchR :: SNat m -> Rhythm n d a -> Rhythm (m :* n) d a
stretchR m (Tuplet    d p) = Tuplet d  (stretchP (durP p) m p )
stretchR m (Phrase ns d p) =
  let s = sum    ns
      n = length ns
  in  multAssoc m s n
  %|  Tuplet (s %* d) (stretchP (s %* n) m (phrase (stretchNL n ns) p))
stretchR m (Ahead  n r) = Ahead  n (stretchR m r)
stretchR m (Behind n r) = Behind n (stretchR m r)
stretchR m (Sequence r1 r2) =
  let n1 = stepsR r1
      n2 = stepsR r2
  in  multComm m (n1 %+ n2)
  %|  multDistribPlus n1 n2 m
  %|  multComm n1 m
  %|  multComm n2 m
  %|  Sequence (stretchR m r1) (stretchR m r2)
stretchR m (Repeat n r) =
  let n1 = stepsR r
  in  multAssoc m n1 n
  %|  Repeat n (stretchR m r)

gridUpL :: SNat u -> Rhythm n d a -> Rhythm (u :* n) (u :* d) a
gridUpL u (Tuplet d p)     = stretchR u (Tuplet (u %* d) p)
gridUpL u (Phrase ns d p)  =
  let s = sum ns
      n = length ns
  in  stretchR u (Tuplet (u %* (s %* d)) (phrase (stretchNL n ns) p))
gridUpL u (Ahead  n r)     = Ahead  (u %* n) (gridUpL u r)
gridUpL u (Behind n r)     = Behind (u %* n) (gridUpL u r)
gridUpL u (Sequence r1 r2) =
  let n1 = stepsR r1
      n2 = stepsR r2
  in  multComm u (n1 %+ n2)
  %|  multDistribPlus n1 n2 u
  %|  multComm n1 u
  %|  multComm n2 u
  %|  Sequence (gridUpL u r1) (gridUpL u r2)
gridUpL u (Repeat t r)     =
     eqSym (multAssoc u (stepsR r) t)
  %| Repeat t (gridUpL u r)

gridUpR :: SNat u -> Rhythm n d a -> Rhythm (u :* n) (d :* u) a
gridUpR u r =
     multComm u (gridR r)
  %| gridUpL u r

shiftl :: SNat t -> SNat u -> Rhythm n d a
       -> Rhythm (u :* n) (u :* d) a
shiftl t u r = Ahead (u %* t) (gridUpL u r)

shiftr :: SNat t -> SNat u -> Rhythm n d a
       -> Rhythm (u :* n) (u :* d) a
shiftr t u r = Behind (u %* t) (gridUpL u r)

sequence :: Rhythm n1 d1 a -> Rhythm n2 d2 a
         -> Rhythm (d2 :* n1 :+ d1 :* n2) (d1 :* d2) a
sequence r1 r2 =
  let d1 = gridR r1
      d2 = gridR r2
  in  multComm d2 d1
  %|  Sequence (gridUpL d2 r1) (gridUpL d1 r2)

evalR :: Rhythm n d a -> Tile n d a
evalR (Tuplet    d p)  = mediaT (evalP p) d
evalR (Phrase ns d p)  =
  let s = sum ns
      n = length ns
  in  multComm s n
  %|  mediaT (evalP (stretchP s n (phrase ns p))) (s %* d)
evalR (Ahead    t  r ) = delayTl t (evalR r)
evalR (Behind   t  r ) = delayTr t (evalR r)
evalR (Sequence r1 r2) = evalR r1 % evalR r2
evalR (Repeat   t  r ) = repeat t r
  where
    repeat :: SNat t -> Rhythm n u a -> Tile (n :* t) u a
    repeat  O    r =
         multComm O (stepsR r)
      %| noneT O (gridR r)
    repeat (S t) r =
         multComm (stepsR r) (S t)
      %| multComm t     (stepsR r)
      %| (evalR r % (repeat t r))

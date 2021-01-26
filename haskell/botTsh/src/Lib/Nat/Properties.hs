{-# LANGUAGE DataKinds
           , TypeOperators
           , GADTs
           , NoImplicitPrelude
  #-}

module Lib.Nat.Properties where

import Lib.Nat
import Lib.Singleton
import Lib.Reasoning
import Lib.Nat.Compare

plus0IdR :: SNat n -> ((n :+ Zero) :==: n)
plus0IdR  O    = refl
plus0IdR (S n) = eqCong S (plus0IdR n)

plusS :: SNat n -> SNat m -> ((Suc (n :+ m)) :==: (n :+ (Suc m)))
plusS  O    _ = refl
plusS (S n) m = eqCong S (plusS n m)

plusComm :: SNat n -> SNat m -> n :+ m :==: m :+ n
plusComm  O    m = eqSym (plus0IdR m)
plusComm (S n) m =
     plusComm n m
  %| eqSym (plusS m n)
  %| qed

plusInjective :: SNat k -> n :==: m -> (n :+ k) :==: (m :+ k)
plusInjective _ eq = eq %| refl

plusAssoc :: SNat n -> SNat m -> SNat k
          -> n :+ (m :+ k) :==: (n :+ m) :+ k
plusAssoc O     _ _ = refl
plusAssoc (S n) m k =
     plusAssoc n m k
  %| qed

mult0L :: SNat n -> Zero :* n :==: Zero
mult0L  _    = refl

mult0R :: SNat n -> n :* Zero :==: Zero
mult0R  O    = refl
mult0R (S n) = mult0R n

mult1IdR :: SNat n -> n :* I :==: n
mult1IdR  O    = refl
mult1IdR (S n) = eqCong S (mult1IdR n)

multS :: SNat n -> SNat m -> n :* Suc m :==: n :+ m :* n
multS O m = eqSym (mult0R m)
multS (S n) m =
     multS n m
  %| multS m n
  %| plusAssoc m n (m %* n)
  %| plusAssoc n m (n %* m)
  %| multComm  n m
  %| plusComm  n m
  %| qed

multComm :: SNat n -> SNat m -> n :* m :==: m :* n
multComm n    O  = mult0R n
multComm n (S m) = multS  n m

multAssoc :: SNat n -> SNat m -> SNat k
          -> (n :* m) :* k :==: n :* (m :* k)
multAssoc O m k = refl
multAssoc (S n) m k =
     multDistribPlus m (n %* m) k
  %| multAssoc n m k
  %| qed

multDistribPlus :: SNat n -> SNat m -> SNat k ->
                  (n :+ m) :* k :==: n :* k :+ m :* k
multDistribPlus  O    _ _ = refl
multDistribPlus (S n) m k =
     multDistribPlus n m k
  %| plusAssoc k (n %* k) (m %* k)
  %| qed

leqPred :: (Suc n) `Leq` (Suc m) -> n `Leq` m
leqPred (SLeqS p) = p

lePred :: (Suc n) `Le` (Suc m) -> n `Le` m
lePred (SLeS p) = p

maxComm :: SNat n -> SNat m -> n `Max` m :==: m `Max` n
maxComm  O     O    = refl
maxComm  O    (S m) = refl
maxComm (S n)  O    = refl
maxComm (S n) (S m) =
     maxComm n m
  %| qed

leqMaxR :: n `Leq` m -> n `Max` m :==: m
leqMaxR (ZLeqN _) = refl
leqMaxR (SLeqS p) = eqCong S (leqMaxR p)

leqMaxR' :: n `Leq` m -> n `Max` m :==: n :+ (m :- n)
leqMaxR' (ZLeqN _) = refl
leqMaxR' (SLeqS p) = eqCong S (leqMaxR' p)

leMaxR :: n `Le` m -> n `Max` m :==: m
leMaxR (ZLeS _) = refl
leMaxR (SLeS p) = eqCong S (leMaxR p)

leMaxR' :: n `Le` m -> n `Max` m :==: n :+ (m :- n)
leMaxR' (ZLeS _) = refl
leMaxR' (SLeS p) = eqCong S (leMaxR' p)

leqSelf :: SNat n -> n `Leq` n
leqSelf  O    = (ZLeqN O)
leqSelf (S n) = (SLeqS (leqSelf n))

eqWeakenLeq :: n :==: m -> SNat n -> n `Leq` m
eqWeakenLeq Refl n = leqSelf n

maxK0 :: SNat k -> Max k Zero :==: k
maxK0 k = maxComm k O %| refl

plusDistribMax :: SNat n -> SNat m -> SNat k ->
                  (Max n m) :+ k :==: Max (n :+ k) (m :+ k)
plusDistribMax n m O =
     plus0IdR n
  %| plus0IdR m
  %| plus0IdR (sMax n m)
  %| refl
plusDistribMax n m (S k) =
     plusComm (sMax n m) (S k)
  %| plusDistribMax n m k
  %| plusComm n (S k)
  %| plusComm m (S k)
  %| plusComm k n
  %| plusComm k m
  %| plusComm k (sMax n m)
  %| eqCong S (plusDistribMax n m k)

multDistribMax :: SNat n -> SNat m -> SNat k ->
                  (Max n m) :* k :==: Max (n :* k) (m :* k)
multDistribMax O _ _     =
     refl
multDistribMax (S n) O k =
     maxK0 (k %+ (n %* k))
  %| refl
multDistribMax (S n) (S m) k =
     multDistribMax n m k
  %| plusComm k (n %* k)
  %| plusComm k (m %* k)
  %| plusComm k (sMax (n %* k) (m %* k))
  %| plusDistribMax (n %* k) (m %* k) k

minusSelf :: SNat n -> n :- n :==: Zero
minusSelf  O    = refl
minusSelf (S n) = minusSelf n

zeroMinus :: SNat n -> Zero :- n :==: Zero
zeroMinus  O    = refl
zeroMinus (S n) = refl

minusIdPlus :: SNat n -> SNat m -> SNat k -> (n :- m) :==: ((n :+ k) :- (m :+ k))
minusIdPlus n m  O    =
     plus0IdR n
  %| plus0IdR m
  %| refl
minusIdPlus n m (S k) =
     plusComm n (S k)
  %| plusComm m (S k)
  %| plusComm k n
  %| plusComm k m
  %| minusIdPlus n m k

distanceLemma :: n `Le` m -> m :==: n :+ (m :- n)
distanceLemma (ZLeS    _) = refl
distanceLemma (SLeS nLem) = eqCong S (distanceLemma nLem)

sucSwap :: SNat n -> SNat m -> n :+ (Suc m) :==: (Suc n) :+ m
sucSwap O     _ = refl
sucSwap (S n) m = eqCong S (sucSwap n m)

plusMinusCancelR :: SNat n -> SNat k -> n :==: (n :+ k) :- k
plusMinusCancelR  n     O    = eqSym (plus0IdR n)
plusMinusCancelR  O    (S k) = eqSym (minusSelf k)
plusMinusCancelR (S n) (S k) =
     sucSwap n k
  %| plusMinusCancelR (S n) k

plusDistMinus :: m `Leq` n -> SNat k -> (n :- m) :==: (n :+ k) :- (m :+ k)
plusDistMinus (ZLeqN n    ) k = plusMinusCancelR n k
plusDistMinus (SLeqS mLeqn) k = plusDistMinus mLeqn k

leqReflexive :: SNat n -> n `Leq` n
leqReflexive  O    = ZLeqN O
leqReflexive (S n) = SLeqS (leqReflexive n)

leqSteps :: n `Leq` m -> SNat k -> n `Leq` (m :+ k)
leqSteps (ZLeqN     m) k = ZLeqN (m %+ k)
leqSteps (SLeqS nLeqm) k = SLeqS (leqSteps nLeqm k)

leqMonoPlus :: n `Leq` m -> SNat k -> (n :+ k) `Leq` (m :+ k)
leqMonoPlus (ZLeqN     m) k = plusComm m k %| leqSteps (leqReflexive k) m
leqMonoPlus (SLeqS nLeqm) k = SLeqS (leqMonoPlus nLeqm k)

leqMonoMult :: n `Leq` m -> SNat k -> (n :* k) `Leq` (m :* k)
leqMonoMult (ZLeqN     m) k = ZLeqN (m %* k)
leqMonoMult (SLeqS nLeqm) k =
     plusComm k (leqFst nLeqm %* k)
  %| plusComm k (leqSnd nLeqm %* k)
  %| leqMonoPlus (leqMonoMult nLeqm k) k

multDistMinus :: m `Leq` n -> SNat k -> (n :- m) :* k :==: (n :* k) :- (m :* k)
multDistMinus (ZLeqN     _) _ = refl
multDistMinus (SLeqS mLeqn) k =
     multDistMinus mLeqn k
  %| plusComm k (leqFst mLeqn %* k)
  %| plusComm k (leqSnd mLeqn %* k)
  %| plusDistMinus (leqMonoMult mLeqn k) k

leqPlusMinusComm :: n `Leq` m -> SNat k -> ((m :- n) :+ k) :==: ((m :+ k) :- n)
leqPlusMinusComm (ZLeqN     _) _ = refl
leqPlusMinusComm (SLeqS nLeqm) k = leqPlusMinusComm nLeqm k

leqMinusPlusAssoc :: n `Leq` m -> i `Leq` j
                  -> ((m :- n) :+ (j :- i)) :==: (m :+ (j :- i)) :- n
leqMinusPlusAssoc nLeqm (ZLeqN     j) = leqPlusMinusComm nLeqm j
leqMinusPlusAssoc nLeqm (SLeqS iLeqj) = leqMinusPlusAssoc nLeqm iLeqj

minusAssocR1 :: SNat n -> SNat m -> SNat k -> k `Leq` n
             -> ((n :+ m) :- k) :==: (m :+ (n :- k))
minusAssocR1 O m _ (ZLeqN O) =
    plus0IdR  m
 %| refl
minusAssocR1 (S n) m O _ =
    plusComm n m
 %| plusS    m n
minusAssocR1 (S n) m (S k) (SLeqS kLeqn) = minusAssocR1 n m k kLeqn

minusAssocL1 :: SNat n -> SNat m -> SNat k -> k `Leq` m
             -> ((n :+ m) :- k) :==: (n :+ (m :- k))
minusAssocL1 n m k kLeqm =
     plusComm n m
  %| minusAssocR1 m n k kLeqm

minusAssocR2 :: SNat m -> k `Leq` n -> ((n :- k) :+ m) :==: ((n :+ m) :- k)
minusAssocR2  m (ZLeqN n) = refl
minusAssocR2 m (SLeqS kLeqn) = minusAssocR2 m kLeqn

minusAssocL2 :: k `Leq` n -> k `Leq` m -> (n :+ (m :- k)) :==: (m :+ (n :- k))
minusAssocL2 (ZLeqN     n) (ZLeqN     m) = plusComm n m %| refl
minusAssocL2 (SLeqS kLeqn) (SLeqS kLeqm) = eqCong S (minusAssocL2 kLeqn kLeqm)

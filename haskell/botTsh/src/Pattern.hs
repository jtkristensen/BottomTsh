{-# LANGUAGE DataKinds
           , GADTs
           , KindSignatures
           , TypeOperators
  #-}

module Pattern where

import Lib.Nat
import Lib.Nat.List
import Lib.Nat.Properties
import Lib.Reasoning

import Polymorphic.Temporal.Media (Media(..), tie)

data Pattern :: Nat -> * -> * where
  Event :: a -> Pattern n a -> Pattern (Suc n) a
  Abyss ::      Pattern n a -> Pattern (Suc n) a
  Annex ::      Pattern n a -> Pattern (Suc n) a
  Empty ::                     Pattern  Zero   a

instance Functor (Pattern n) where
  fmap f (Event a p) = Event (f a) (fmap f p)
  fmap f (Abyss   p) = Abyss       (fmap f p)
  fmap f (Annex   p) = Annex       (fmap f p)
  fmap _  Empty      = Empty

appendP :: Pattern n a -> Pattern m a -> Pattern (n :+ m) a
(Event a p) `appendP` p' = Event a (p `appendP` p')
(Abyss   p) `appendP` p' = Abyss   (p `appendP` p')
(Annex   p) `appendP` p' = Annex   (p `appendP` p')
(Empty    ) `appendP` p' = p'

noneP :: SNat n -> Pattern n a
noneP  O    = Empty
noneP (S n) = expandP n (Abyss Empty)

durP :: Pattern n a -> SNat n
durP (Event _ p) = S (durP p)
durP (Abyss   p) = S (durP p)
durP (Annex   p) = S (durP p)
durP (Empty    ) = O

annexP :: SNat n -> Pattern n a
annexP  O    = Empty
annexP (S n) = Annex (annexP n)

expandP :: SNat m -> Pattern n a -> Pattern (n :+ m) a
expandP m p = p `appendP` annexP m

stretchP :: SNat n -> SNat m -> Pattern n a -> Pattern (m :* n) a
stretchP n m p = multComm n m %| stretch' n m p
  where
    stretch' :: SNat n -> SNat m -> Pattern n a -> Pattern (n :* m) a
    stretch'    n   O     _           = multComm n O %| Empty
    stretch'    O  (S m) (Empty    )  = Empty
    stretch' (S n) (S m) (Event a p)  = Event a $ annexP m `appendP` stretch' n (S m) p
    stretch' (S n) (S m) (Abyss   p)  = Abyss   $ annexP m `appendP` stretch' n (S m) p
    stretch' (S n) (S m) (Annex   p)  = Annex   $ annexP m `appendP` stretch' n (S m) p

phrase :: NatList len sum -> Pattern len a -> Pattern sum a
phrase Nil          _ = Empty
phrase (O   ::: rest) (Event a p) = phrase rest p
phrase (O   ::: rest) (Annex   p) = phrase rest p
phrase (O   ::: rest) (Abyss   p) = phrase rest p
phrase (S n ::: rest) (Event a p) = expandP n (Event a Empty) `appendP` phrase rest p
phrase (S n ::: rest) (Annex   p) = expandP n (Annex   Empty) `appendP` phrase rest p
phrase (S n ::: rest) (Abyss   p) = expandP n (Abyss   Empty) `appendP` phrase rest p

evalP :: Pattern n a -> Media n a
evalP Empty                   = None  O
evalP (Event a Empty        ) = Some  i a
evalP (Event a p@(Event _ _)) = Some  i a :+:   evalP p
evalP (Event a p@(Annex   _)) = Some  i a `tie` evalP p
evalP (Event a p@(Abyss   _)) = Some  i a :+:   evalP p
evalP (Annex   Empty        ) = None  i
evalP (Annex   p@(Event _ _)) = None  i   :+:   evalP p
evalP (Annex   p@(Annex   _)) = None  i   `tie` evalP p
evalP (Annex   p@(Abyss   _)) = None  i   :+:   evalP p
evalP (Abyss   Empty        ) = None  i
evalP (Abyss   p@(Event _ _)) = None  i  :+:   evalP p
evalP (Abyss   p@(Annex   _)) = None  i  `tie` evalP p
evalP (Abyss     (Abyss   p)) = None ii  :+:   evalP p

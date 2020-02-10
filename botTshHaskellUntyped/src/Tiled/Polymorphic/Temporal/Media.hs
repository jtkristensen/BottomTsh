
module Tiled.Polymorphic.Temporal.Media where

import Polymorphic.Temporal.Media
import Units

data Tiled a = Tile { pre   :: Duration
                    , post  :: Duration
                    , value :: Media a
                    }
               deriving (Show)

infixr 3 %%
(%%) :: Temporal a => Tiled a -> Tiled a -> Tiled a
(Tile pr1 po1 m1) %% (Tile pr2 po2 m2) =
  Tile (max pr1 (pr1 - d)) (max po2 (po2 + d))
    (if d > 0 then m1             :=: delayM d m2
              else delayM (-d) m1 :=: m2)
  where
    d = po1 - pr2

tiled :: Temporal a => Media a -> Tiled a
tiled m = Tile 0 (dur m) m

media :: (Temporal a, Take a, Drop a) => Tiled a -> Media a
media (Tile pr po m) = takeM (po - pr) (dropM pr m)

reset, coReset, inverse :: Tiled a -> Tiled a
reset   (Tile pr  _ m) = Tile pr pr m
coReset (Tile _  po m) = Tile po po m
inverse (Tile pr po m) = Tile po pr m

liftT :: (Media a -> Media b) -> (Tiled a -> Tiled b)
liftT f (Tile pr po m) = Tile pr po (f m)

instance Functor Tiled where
  fmap f = liftT (fmap f)

instance Temporal a => Temporal (Tiled a) where
  none d = if   d < 0
           then Tile d 0 (none (-d))
           else Tile 0 d (none d)
  dur  t = post t - pre t

-- Needs testing.
instance Scale a => Scale (Tiled a) where
  scaleM d (Tile pr po m) = Tile (pr * d) (po * d) (scaleM d m)

instance Temporal a => Delay (Tiled a) where
  delayM d (Tile pr po m) = Tile (pr + d) (po + d) m




import Polymorphic.Temporal.Media

import Test.HUnit
import Units

-- Runs a test in the IO monad, returns number of errors and failiures.
runTest :: Test -> IO Int
runTest t = do state <- runTestTT t
               return $ errors state + failures state

-- Combines multiple tests into one.
infixr 0 ~>
(~>) :: Test -> Test -> Test
(~>) t1 t2 = TestList [t1, t2]

-- Run two tests, print the output separated by "breakline".
infixr 1 -->
(-->) :: IO Bool -> IO Bool -> IO Bool
(-->) p q = do b0 <- p
               breakline
               b1 <- q
               return $ b0 && b1

-- Conviniently named values.
opening   = do putStrLn ""
               breakline
ending    = do breakline
breakline = do putStrLn $ replicate 60 '*'

-- Tests for Polymorphic.Temporal.Media
data Value = V Duration
  deriving (Show, Eq)

instance Temporal Value where
  none      = V
  dur (V d) = d

instance Take Value where
  takeM d (V d') = V $ min d d'

instance Drop Value where
  dropM d (V d') = V $ max (d' - d) 0

takePTM :: Test
takePTM =
     aEq "p2 (takeM (1 % 2) p1)"
          p2 (takeM (1 % 2) p1)
  ~> aEq "(p1 :+: p2) (takeM (3 % 2) $ p1 :+: p1 :+: p1)"
          (p1 :+: p2) (takeM (3 % 2) $ p1 :+: p1 :+: p1)
  ~> aEq "p1 (takeM 1 p1)"
          p1 (takeM 1 p1)
  ~> aEq "p1 (takeM 1 p1)"
          p1 (takeM 2 p1)
  where
    p1 = Prim (V 1)
    p2 = Prim (V (1 % 2))

dropPTM :: Test
dropPTM =
     aEq "p2 (dropM (1 % 2) p1)"
          p2 (dropM (1 % 2) p1)
  ~> aEq "(p1 :+: p2) (dropM (3 % 2) $ p1 :+: p1 :+: p1)"
          (p2 :+: p1) (dropM (3 % 2) $ p1 :+: p1 :+: p1)
  ~> aEq "(none 0) (dropM 1 p1)"
          (none 0) (dropM 1 p1)
  ~> aEq "(none 0) (dropM 2 p1)"
          (none 0) (dropM 2 p1)
  where
    p1 = Prim (V 1)
    p2 = Prim (V (1 % 2))

ptm :: Test
ptm = TestList $
  [ takePTM
  , dropPTM
  ]

aEq :: (Show a, Eq a) => String -> a -> a -> Test
aEq title exspect actual = TestCase $ assertEqual title exspect actual

-- Let's go.
main :: IO ()
main = do opening
          putStrLn "Polymorphic.Temporal.Media"
          runTest  ptm
          ending

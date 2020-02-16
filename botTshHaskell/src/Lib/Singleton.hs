{-# LANGUAGE PolyKinds
           , TypeFamilies
  #-}

module Lib.Singleton where

data family Singleton ( t :: k )

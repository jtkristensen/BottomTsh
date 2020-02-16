{-# LANGUAGE DataKinds
           , GADTs
           , KindSignatures
           , TypeFamilies
           , TypeOperators
           , NoImplicitPrelude
  #-}

module Lib.Bool where

data Bool :: * where
  True  :: Bool
  False :: Bool

data Top :: * where
  T :: Top

data Bot :: * where

-- todo : decidability ?

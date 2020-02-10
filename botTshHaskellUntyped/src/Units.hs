
module Units ( (%)
             , numerator
             , denominator
             , Duration
             , Time
             , Unit
             , Size
             , Steps
             ) where

import Data.Ratio ((%), numerator, denominator)

type Duration = Rational
type Time     = Rational
type Unit     = Integer
type Size     = Integer
type Steps    = Integer

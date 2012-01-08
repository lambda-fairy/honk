-- |
-- Module      : Sound.Honk.Types
-- Copyright   : (C) 2011 Chris Wong
-- License     : Apache License 2.0
--
-- Maintainer  : chrisyco@gmail.com
-- Portability : portable
--
-- Datatypes used by Honk.

module Sound.Honk.Types
    ( Note(..)
    , Frequency
    , Duration
    ) where

type Frequency = Double
type Duration = Double

data Note = Note { frequency :: Frequency, duration :: Duration }
    deriving (Eq, Ord, Show)

-- |
-- Module      : Sound.Honk.Types
-- Copyright   : (C) 2011 Chris Wong
-- License     : Apache License 2.0
--
-- Maintainer  : chrisyco@gmail.com
-- Portability : portable
--
-- Data types used by Honk.

module Sound.Honk.Types
    ( Note(..)
    , Duration
    , Frequency
    ) where

type Duration = Double
type Frequency = Double

-- | Represents a single note, with a duration in seconds and a
-- frequency in hertz.
data Note = Note { duration :: Duration, frequency :: Frequency }
    deriving (Eq, Ord, Show)

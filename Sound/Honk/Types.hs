-- | Core data types used by Honk.

module Sound.Honk.Types
    ( Note(..)
    ) where

-- | Represents a single note, with a duration in seconds and a
-- frequency in hertz.
data Note = Note { duration :: Rational, frequency :: Double }
    deriving (Eq, Ord, Show)

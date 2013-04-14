-- | Random utility functions.

module Sound.Honk.Util
    (
      -- * Conversions
      freqToMidi
    , midiToFreq

      -- * Combinators
    , loop

    ) where

-- | Convert a frequency to a MIDI note value.
freqToMidi :: Floating a => a -> a
freqToMidi n = 69 + 12 * log2 (n / 440)

-- | Convert a MIDI note value to a frequency.
midiToFreq :: Floating a => a -> a
midiToFreq n = 440 * 2 ** ((n - 69) / 12)

log2 :: Floating a => a -> a
log2 = logBase 2

-- | Repeat a sequence a specified number of times.
loop :: Int -> [a] -> [a]
loop n = concat . replicate n

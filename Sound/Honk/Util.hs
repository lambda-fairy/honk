-- |
-- Module      : Sound.Honk.Util
-- Copyright   : (C) 2011 Chris Wong
-- License     : Apache License 2.0
--
-- Maintainer  : chrisyco@gmail.com
-- Portability : portable
--
-- Utilities for converting frequencies to and from MIDI note values.

module Sound.Honk.Util
    (
    -- * Conversion functions
      freqToMidi
    , midiToFreq
    ) where

freqToMidi :: Floating a => a -> a
freqToMidi n = 69 + 12 * log2 (n / 440)

midiToFreq :: Floating a => a -> a
midiToFreq n = 440 * 2 ** ((n - 69) / 12)

log2 :: Floating a => a -> a
log2 = logBase 2

{-# LANGUAGE CPP #-}

-- |
-- Module      : Sound.Honk
-- Copyright   : (C) 2011 Chris Wong
-- License     : Apache License 2.0
--
-- Maintainer  : chrisyco@gmail.com
-- Portability : non-portable (requires POSIX or Win32)
--
-- Cross-platform interface to the PC speaker.
--
-- Here's an example:
--
-- > simpleBeep = playNote $ Note 440 1.0

module Sound.Honk
    (
    -- * Types
      module Sound.Honk.Types

    -- * Output
    , playNote
    , playNotes

    -- * Utility functions
    , module Sound.Honk.Util
    ) where

import Prelude hiding ( mapM_ )
import Data.Foldable ( Foldable, mapM_ )

import Sound.Honk.Internal
import Sound.Honk.Types
import Sound.Honk.Util

-- | Play a note.
--
-- To play more than one note, use 'playNotes'.
playNote :: Note -> IO ()
playNote = playNotes . (:[])

-- | Play multiple notes in order, one after the other.
playNotes :: Foldable t => t Note -> IO ()
playNotes notes = withBeepFd run
    where
        run handle = mapM_ (\(Note freq dur) -> beepDo handle freq dur) notes

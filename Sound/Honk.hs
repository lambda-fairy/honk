-- | Cross-platform interface to the PC speaker.
--
-- Here's an example:
--
-- > simpleBeep = play [Note 1.0 440]
--
-- For more examples, see the readme.

module Sound.Honk
    (
    -- * Output
      play
    , playOne

    -- * Types
    , module Sound.Honk.Types

    -- * Utility functions
    , module Sound.Honk.Util

    ) where

import Sound.Honk.Internal
import Sound.Honk.Types
import Sound.Honk.Util

-- | Play multiple notes in order, one after the other.
play :: [Note] -> IO ()
play notes = withBeepFd run
  where
    run handle = mapM_ (\(Note dur freq) -> beepDo handle dur freq) notes

-- | Play a single note.
playOne :: Note -> IO ()
playOne = play . (:[])

{-# LANGUAGE CPP, ForeignFunctionInterface #-}

#if __GLASGOW_HASKELL__ < 701
-- Not available prior to GHC 7.1
#  define interruptible safe
#else
{-# LANGUAGE InterruptibleFFI #-}
#endif

-- |
-- Module      : Sound.Honk.Internal
-- Copyright   : (C) 2011 Chris Wong
-- License     : Apache License 2.0
--
-- Maintainer  : chrisyco@gmail.com
-- Portability : non-portable (requires POSIX or Win32)
--
-- Low level FFI interface. You should never need to use this directly.


module Sound.Honk.Internal
    (
    -- * Types
      BeepFd(..)

    -- * Core functions
    , beepOpen
    , beepDo
    , beepClose

    -- * Convenience functions
    , withBeepFd
    ) where

import Control.Applicative ( (<$>) )
import Control.Exception.Base ( bracket )
import Foreign.C ( throwErrnoIfMinus1, throwErrnoIfMinus1_ )
import Foreign.C.Types

newtype BeepFd = BeepFd CInt

-- | Open a handle to the console.
--
-- Use 'withBeepFd' instead if possible, since it keeps track of closing
-- the handle automatically.
beepOpen :: IO BeepFd
beepOpen = BeepFd <$> throwErrnoIfMinus1 "beepOpen" c_beepOpen

-- | Perform a beep.
beepDo :: BeepFd -- ^ A console handle, as returned by 'beepOpen'
       -> Double -- ^ Duration, in seconds
       -> Double -- ^ Frequency of the beep, in hertz
       -> IO ()
beepDo (BeepFd fd) dur freq =
    throwErrnoIfMinus1_ "beepDo" $
        c_beepDo fd (realToFrac freq) (realToFrac dur)

-- | Close the handle.
beepClose :: BeepFd -> IO ()
beepClose (BeepFd fd) = c_beepClose fd

-- | Run a function that uses a 'BeepFd', opening and closing the
-- handle automatically.
withBeepFd :: (BeepFd -> IO a) -> IO a
withBeepFd = bracket beepOpen beepClose

foreign import ccall "honk.h beep_open"
    c_beepOpen :: IO CInt

foreign import ccall interruptible "honk.h beep_do"
    c_beepDo :: CInt -> CDouble -> CDouble -> IO CInt

foreign import ccall "honk.h beep_close"
    c_beepClose :: CInt -> IO ()
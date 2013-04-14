---
layout: default
title: Examples
---

    > import Sound.Honk

This is a literate Haskell file. To run it, simply paste this in a `.lhs` file
and load it up in GHCi. You can then play each of these by typing in their
names.

By the way, I welcome [additions][] to this page!

[additions]: https://github.com/lfairy/honk/blob/gh-pages/examples/index.markdown

    > beepOnce = playOne $ Note 1.0 440 -- 440 Hz for 1 second

    > airport = play $ [Note 0.5 261.6, Note 0.5 329.6, Note 0.5 392.0,
    >                   Note 1.5 532.3]

    > connectionLost = play $ loop 5 $ [Note 1 440, Note 1 0]

    > glissando = play $ map (Note 0.01) $ map midiToFreq [30,30.05..120]

My favorite one&mdash;once you try this, you'll understand why:

    > phoneCall = ring ++ [Note 0.2 0] ++ ring ++ [Note 2 0]
    >     where ring = loop 8 $ map (Note 0.025) $ map midiToFreq [72,76]

Honk
====

**Honk** is a PC speaker library written in Haskell. Beep with pleasure!

Using
-----

An example is worth a thousand words, so here's a three thousand word essay:

```haskell
import Sound.Honk

beepOnce = playNote $ Note 1.0 440 -- 440 Hz for 1 second

airport = playNotes $ [Note 0.5 261.6, Note 0.5 329.6, Note 0.5 392.0,
                        Note 1.5 532.3]

connectionLost = playNotes $ concat $ take 5 $ repeat [Note 1 440, Note 1 0]

glissando = playNotes $ map (Note 0.01) $ map midiToFreq [30,30.05..120]
```

`Note` has two fields: the *duration* in seconds, and the *frequency* in hertz.
There is a very helpful [table of frequencies][Frequency table] that you can use
to find the right value.

`playNote` has the type signature `Note -> IO ()`. Its return value can be passed
around just like any other `IO` action.

Installing
----------

Follow the build instructions below, then:

    cabal install

Building
--------

    git clone git://github.com/chrisyco/honk.git
    cd honk
    cabal build

Developing
----------

The source code is hosted at [Github][]. Feel free to fork!

[Frequency table]: http://www.phys.unsw.edu.au/jw/notes.html
[GitHub]: https://github.com/chrisyco/honk

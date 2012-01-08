Honk
====

**Honk** is a PC speaker library written in Haskell. Beep with pleasure!

Using
-----

An example is worth a thousand words, so here's a three thousand word essay:

```haskell
import Sound.Honk

beepOnce = playNote $ Note 440 1 -- 440 Hz for 1 second

beepMany = playNotes $ [Note 261.6 0.5, Note 329.6 0.5, Note 392.0 0.5,
                        Note 532.3 1.5]

infiniteLoop = playNotes $ cycle [Note 440 1, Note 0 1]
```

`Note` has two fields: the *frequency* in hertz, and the *duration* in seconds.
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

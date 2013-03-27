---
layout: default
title: Tutorial
---

First off, [install](../install) the library if you haven't done so already.
This will be really hard to follow if you don't ;)


First steps
-----------

The basic unit in Honk is the `Note`. A note has a duration and a frequency. You
play the note using the aptly named `playNote` function.

To start off, we'll create a program that beeps an *A* for one second. Type the
following code your favorite text editor and save it as "OneBeep.hs":

    import Sound.Honk
    main = playNote (Note 1 440)

Now run it:

    runghc OneBeep.hs

You should hear a nice long beep coming from inside your computer.

Try changing the "440" to other numbers. How does it sound? If you're more
musically inclined, there is a very helpful [table of frequencies][] you can use
to find the right number. It's impossible to break anything, so feel free to
experiment.


Linux issues
------------

If you use Linux, you'll probably get this message:

    *** Exception: beepDo: permission denied (Operation not permitted)

This is because under Linux, for security reasons, only the root user can
control the PC speaker.

To fix this problem, just run it under `sudo`. For example, you would run the
above example like so:

    sudo runghc OneBeep.hs


Creating a melody
-----------------

Of course, most music consists of more than one note. Fortunately, Honk's
incredibly well thought out design allows for this using the `playNotes`
function (note the extra `s`).

Save the following code in a file named "Airport.hs":

    import Sound.Honk
    main = playNotes [ Note 0.5 261.6, Note 0.5 329.6, Note 0.5 392.0
                     , Note 1.5 532.3 ]


The end of the beginning
------------------------

After this brief tutorial, I hope you've learned a fair bit about Honk! Honk
itself is very simple, but the language behind it can be both powerful and
intimidating. The [examples](../examples) page may provide inspiration for the
curious.

[table of frequencies]: http://www.phys.unsw.edu.au/jw/notes.html

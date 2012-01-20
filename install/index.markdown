---
layout: default
title: Installation
---

Honk can be installed easily using cabal-install:

    cabal update
    cabal install honk

Now it's installed, you can start [using it](../learn)!

Linux
-----

For usability reasons, some Linux distros (such as Ubuntu) disable the PC
speaker by default. Fortunately, it's easy to turn it back on:

    sudo modprobe -v pcspkr

Unfortunately, this only takes effect until the computer reboots. To make it
more permanent, open the file `/etc/modules` in your favorite text editor and
add the line

    pcspkr

to the end of the file. The driver will then be loaded automatically.

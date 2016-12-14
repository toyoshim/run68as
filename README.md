# run68as

## What is run68as
Minimum patch set to compile run68 as an application specific runtime with
extensible hooks. This patch makes core part of run68 compile with Emscripten or
other compilers for POSIX environments and so on, but without any system call
emulations.

## What is run68
run68 is an execution environment to run X68000 CUI applications for Human68k.
It was originally developped by Yokko for Windows.

## What "extensible" hooks means
You can write your own system call handers for your specific application
outside the run68 core. E.g., you can write your own DOSCALL, IOCS CALL
emulations for your specific applications, or even I/O accesses can be hooked.
Thus, you may have a chance to run non-CUI applications with a strong support
of run68 core runtime.

## What kind of application could work
Who know?
At this point, I succeeded to run Z-MUSIC v1.10, v2.08, and SION2 with
dedicated system call emulations.

Please visit https://bit.ly/sion2 to confirm what can be done with this.

## How to build
```
% git clone https://github.com/toyoshim/run68as.git
% cd run68as
% git submodule update --init
% make
```
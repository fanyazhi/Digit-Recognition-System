#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/yf92/ece5775/lab3/ecelinux/digitrec.prj/solution1/.autopilot/db/a.g.bc ${1+"$@"}
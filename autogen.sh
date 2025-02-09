#!/bin/sh
# Run this to generate all the initial makefiles, etc.

srcdir=`dirname $0`
test -z "$srcdir" && srcdir=.

PKG_NAME="Byzanz"

(test -f $srcdir/configure.ac \
  && test -f $srcdir/gifenc/gifenc.c \
  && test -d $srcdir/src) || {
    echo -n "**Error**: Directory "\`$srcdir\'" does not look like the"
    echo " top-level directory"
    exit 1
}


which mate-autogen || {
    echo "You need to install gnome-common from the MATE CVS"
    exit 1
}
REQUIRED_AUTOMAKE_VERSION=1.8 \
USE_GNOME2_MACROS=1 \
USE_COMMON_DOC_BUILD=yes \
. mate-autogen

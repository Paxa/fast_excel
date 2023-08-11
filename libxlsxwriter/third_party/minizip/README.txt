The souce files in this directory are included in libxlsxwriter from the
contrib/minizip/ directory of zlib-1.2.8.

The files zip.h and ioapi.h have had a small number of comments modifed from
C++ to C style to avoid warnings with -pedantic -ansi.

In addition, the Makefile has been changed to not assume rm(1) is installed at
/bin/rm, mainly for NixOS and similar systems.

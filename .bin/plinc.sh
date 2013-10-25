#!/bin/sh
find `perl -e 'map { print $_, " " unless $_ eq "." } @INC'` -type f -name *.pm -print | sort -u

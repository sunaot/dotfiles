#!/bin/sh
find `perl -e 'print join(" ", grep {$_ ne "."} @INC)'` -name *.pm -print | sort -u

#!/bin/bash
if [ $# -lt 1 ]; then
  echo "usage: plver [Perl module name]"
  exit 1
fi
pm_name=$1
perl -M$pm_name -e "print '$pm_name version: ', \$$pm_name::VERSION"
echo


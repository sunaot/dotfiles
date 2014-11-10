#!/bin/bash
dir=$1; shift
if [ $# -gt 1 ]; then
  vim $(find $dir -type f $@)
else
  vim $(find $dir -type f)
fi

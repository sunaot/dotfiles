#!/bin/bash
dir=$1; shift
vim $(find $dir -type f $@)

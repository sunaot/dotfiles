#!/bin/bash
# Usage: vim_search <directory to find> -- [other file names you want to edit]
#
#   Basic form. Find directory and edit files (only files)
#
#       vim_search /etc/init.d
#
#   Pass through arguments to `find` command
#
#       vim_search /var/log -name *.log
#
#   Files can be specified. File names are passed directly to Vim comamnd.
#
#       vim_search /etc/init.d -- file/path

for args in "$@"
do
  if [[ $args == '--' ]];then
    shift; break
  fi
  if echo $args | grep '=' >/dev/null 2>&1;then
    option=$(echo $args | cut -d= -f1)
    option_param=$(echo $args | cut -d= -f2)
    find_command_args="$find_command_args $option='$option_param'"
  else
    find_command_args="$find_command_args $args"
  fi
  shift
done

if ! echo $find_command_args | grep '-type' >/dev/null 2>&1; then
  find_command_args="$find_command_args -type f"
fi

# for debug
echo find_command_args: $find_command_args
echo vim_args: $@

vim $(find $find_command_args) $@

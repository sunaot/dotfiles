# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export LANG=`locale -a| \grep --color=none -iP "ja_jp\.utf-?8" || echo -n C`
export LESS=-q

# User specific aliases and functions
complete -d cd # cd の補完ではディレクトリのみを対象にする

# Prompt setting
SYSTEMPERL='/usr/bin/perl'

if [ `uname` = "Darwin" ]; then
  CURRENT_GROUP_NAME='id -gn'
elif [ `uname` = "Linux" ]; then
  CURRENT_GROUP_NAME='id -a | $SYSTEMPERL -e "while(<>) { print \$_ =~ /gid=\\d+\\((.*?)\\)/ }"'
fi
CURRENT_GIT_BRANCH="git symbolic-ref HEAD 2>/dev/null | sed -e 's/refs\/heads\///'" # will be use --short option
if which git > /dev/null 2>&1 && $SYSTEMPERL -e '1;' > /dev/null 2>&1 ; then
  # with Git and Perl
  export PS1="\[\033[1;4;32m\][\H]:\[\033[0m\]\[\033[1;37m\]\w\[\033[0m\]\n[\[\033[1;31m\]\$($CURRENT_GIT_BRANCH)\[\033[0m\]|\u(\[\033[1;36m\]\$($CURRENT_GROUP_NAME)\[\033[0m\])]\\$ "
elif $SYSTEMPERL -e '1;' > /dev/null 2>&1 ; then
  # with Perl
  export PS1="\[\033[1;4;32m\][\H]:\[\033[0m\]\[\033[1;37m\]\w\[\033[0m\]\n[\u(\[\033[1;36m\]\$($CURRENT_GROUP_NAME)\[\033[0m\])]\\$ "
else
  # with no Perl
  export PS1="\[\033[1;4;32m\][\H]:\[\033[0m\]\[\033[1;37m\]\w\[\033[0m\]\n[\u]\\$ "
fi

source ~/.bash.d/history
source ~/.bash.d/alias
source ~/.bash.d/functions
[ -e ~/.bash.d/perl ] && source ~/.bash.d/perl

# vim: nowrap sw=2 sts=2 ts=2 noet ff=unix:

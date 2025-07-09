# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export LANG=`locale -a| $GREP --color=none -iP "ja_jp\.utf-?8" || echo -n C`
export LESS=-q

# User specific aliases and functions
complete -d cd # cd の補完ではディレクトリのみを対象にする

CURRENT_BRANCH="git branch --show-current 2>/dev/null"
if which git > /dev/null 2>&1; then
  export PS1="\[\033[1;4;32m\][\H]:\[\033[0m\]\[\033[1;37m\]\w\[\033[0m\]\n[\[\033[1;31m\]\$($CURRENT_BRANCH)\[\033[0m\]|\u]\\$ "
else
  export PS1="\[\033[1;4;32m\][\H]:\[\033[0m\]\[\033[1;37m\]\w\[\033[0m\]\n[\u]\\$ "
fi

source ~/.bash.d/history
source ~/.bash.d/alias
source ~/.bash.d/functions

# vim: nowrap sw=2 sts=2 ts=2 noet ff=unix:

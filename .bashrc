# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export NLS_LANG=.UTF8
export PATH=$PATH:$ORACLE_HOME/bin

# User specific aliases and functions
complete -d cd # cd の補完ではディレクトリのみを対象にする
export PS1="\[\033[1;4;32m\][\H]:\[\033[0m\]\[\033[1;37m\]\w\[\033[0m\]\n[\u]\\$ "
# alias
alias l='ls -l'
alias ee='exit'
alias e='exit'
alias rm='rm -i'
alias lr='less -r'

alias c='cd'
alias x='cd ..'
alias b='cd -'
alias v='vim'
alias view='vim -R'
alias sv='sudo vim'
alias g='newgrp'
alias i='id -a'


# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export NLS_LANG=.UTF8
export LANG=ja_JP.utf8

# User specific aliases and functions
complete -d cd # cd の補完ではディレクトリのみを対象にする
# export PS1="\[\033[1;4;32m\][\H]:\[\033[0m\]\[\033[1;37m\]\w\[\033[0m\]\n[\u]\\$ "
# with groupname but Ruby required.
export PS1="\[\033[1;4;32m\][\H]:\[\033[0m\]\[\033[1;37m\]\w\[\033[0m\]\n[\u(\[\033[1;36m\]`id -a |  ruby -e '$stdin.read.slice(/gid=\d+\((.*?)\)/); puts $1'`\[\033[0m\])]\\$ "  # light cyan
# alias
alias rawls='/bin/ls'
alias ls='ls --color=auto --show-control-char'
alias l='ls -l'
alias la='ls -la'
alias ee='exit'
alias e='exit'
alias rm='rm -i'
alias lr='less -r'

alias c='cd'
alias x='cd ..'
alias b='cd -'
alias v='vim'
alias view='vim -R'
alias g='newgrp'
alias i='id -a'


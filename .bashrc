# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export NLS_LANG=.UTF8
export LANG=ja_JP.utf8
source ~/.bash.d/history
source ~/.bash.d/alias

# User specific aliases and functions
complete -d cd # cd の補完ではディレクトリのみを対象にする

# Prompt setting
if ruby -e 'exit 0' > /dev/null 2>&1 ; then
	# with Ruby
	export PS1="\[\033[1;4;32m\][\H]:\[\033[0m\]\[\033[1;37m\]\w\[\033[0m\]\n[\u(\[\033[1;36m\]`id -a |  ruby -e '$stdin.read.slice(/gid=\d+\((.*?)\)/); puts $1'`\[\033[0m\])]\\$ "  # light cyan
else
	# with no Ruby
	export PS1="\[\033[1;4;32m\][\H]:\[\033[0m\]\[\033[1;37m\]\w\[\033[0m\]\n[\u]\\$ "
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
# vim: nowrap sw=2 sts=2 ts=2 noet ff=unix:

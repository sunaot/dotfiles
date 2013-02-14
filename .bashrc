# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export LANG=`locale -a|/bin/grep --color=none -iP "ja_jp\.utf-?8" || echo -n C`
source ~/.bash.d/history
source ~/.bash.d/alias
source ~/.bash.d/functions

# User specific aliases and functions
complete -d cd # cd の補完ではディレクトリのみを対象にする

GREPCMD=`/usr/bin/which grep`
# Prompt setting
if which git > /dev/null 2>&1 && ruby -e 'exit 0' > /dev/null 2>&1 ; then
  # with Git and Ruby
  export PS1="\[\033[1;4;32m\][\H]:\[\033[0m\]\[\033[1;37m\]\w\[\033[0m\]\n[\[\033[1;31m\]\$(git branch 2>/dev/null | $GREPCMD "^[*]" | cut -d ' ' -f 2)\[\033[0m\]|\u(\[\033[1;36m\]`id -a | ruby -e '$stdin.read.slice(/gid=\d+\((.*?)\)/); puts $1'`\[\033[0m\])]\\$ " # light cyan
elif which git > /dev/null 2>&1 && perl -e '1;' > /dev/null 2>&1 ; then
  # with Git and Perl
  export PS1="\[\033[1;4;32m\][\H]:\[\033[0m\]\[\033[1;37m\]\w\[\033[0m\]\n[\[\033[1;31m\]\$(git branch 2>/dev/null | $GREPCMD "^[*]" | cut -d ' ' -f 2)\[\033[0m\]|\u(\[\033[1;36m\]`id -a | perl -e 'while(<>) { print $_ =~ /gid=\d+\((.*?)\)/ }'`\[\033[0m\])]\\$ "   # light cyan
elif perl -e '1;' > /dev/null 2>&1 ; then
  # with Perl
  export PS1="\[\033[1;4;32m\][\H]:\[\033[0m\]\[\033[1;37m\]\w\[\033[0m\]\n[\u(\[\033[1;36m\]`id -a | perl -e 'while(<>) { print $_ =~ /gid=\d+\((.*?)\)/ }'`\[\033[0m\])]\\$ "   # light cyan
else
  # with no Ruby|Perl
  export PS1="\[\033[1;4;32m\][\H]:\[\033[0m\]\[\033[1;37m\]\w\[\033[0m\]\n[\u]\\$ "
fi

[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
# vim: nowrap sw=2 sts=2 ts=2 noet ff=unix:

# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
export PATH=$HOME/bin:$PATH
export SVN_EDITOR=vim

stty stop undef # stop terminal locking (then Ctrl+S would be free.)
screen -R

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function


# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
export PATH=$HOME/bin:$PATH

stty stop undef # stop terminal locking (then Ctrl+S would be free.)

# vim: nowrap sw=2 sts=2 ts=2 noet ff=unix:

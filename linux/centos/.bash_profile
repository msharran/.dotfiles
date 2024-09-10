# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
export PATH=/snap/bin:$PATH
export PATH=$HOME/.local/go/bin:$PATH

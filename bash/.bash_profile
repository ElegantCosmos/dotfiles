# Local .bash_profile file
#echo bash_profile

export PS1='\[\e[0;37m\]\u@\h:\w\$ \[\e[m\]'

export EDITOR=vim

# Read bashrc if it exists
if [[ -z "$TMUX" ]]; then
	if [ -f $HOME/.bashrc ]; then
		source $HOME/.bashrc
	fi
fi

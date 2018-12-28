# Local .bash_profile file
echo bash_profile

# Read bashrc if it exists
if [[ -z "$TMUX" ]]; then
	if [ -f $HOME/.bashrc ]; then
		source $HOME/.bashrc
	fi
fi

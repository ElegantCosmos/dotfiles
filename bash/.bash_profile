# .bash_profile

# make sure that PATH is empty before path_helper runs for tmux on macOS
if [ -n "$TMUX" ]; then
	if [ -f /etc/profile ]; then
		PATH=""
		source /etc/profile
	fi
fi

# Read bashrc if it exists
if [ -f $HOME/.bashrc ]; then
	source $HOME/.bashrc
fi

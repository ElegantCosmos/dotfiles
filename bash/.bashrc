# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	source /etc/bashrc
fi

# Source local definitions
if [ -f $HOME/.bashrc_local ]; then
    source $HOME/.bashrc_local
fi

export PS1='\u@\h:\w\$ '

export EDITOR=vim

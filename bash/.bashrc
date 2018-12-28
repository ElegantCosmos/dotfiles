# Local .bashrc file

export PS1='\[\e[0;37m\]\u@\h:\w\$ \[\e[m\]'

export EDITOR=vim

# Source local definitions
if [ -f $HOME/.bashrc_local ]; then
    source $HOME/.bashrc_local
fi

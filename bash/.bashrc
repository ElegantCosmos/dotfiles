# Local .bashrc file
#echo bashrc

export EDITOR=vim

# ls command
alias ls='ls -Gh'

# tmux related settings
alias tmux='tmux -2' # Force tmux to assume the terminal supports 256 colours.
if [ -f "$HOME/.tmux.completion.bash" ]; then
	source $HOME/.tmux.completion.bash
fi

### ls colors
if [ -f "$HOME/.dircolors.256" ]; then
	eval "$(dircolors $HOME/.dircolors.256)"
fi

if [[ "$OSTYPE" == "linux"* ]]; then # Linux
	# enable color support of ls and also add handy aliases
	if [ -x /usr/bin/dircolors ]; then
		test -r $HOME/.dircolors.256 && eval "$(dircolors -b $HOME/.dircolors.256)" || eval "$(dircolors -b)"
		alias ls='ls --color=auto'
		alias dir='dir --color=auto'
		alias vdir='vdir --color=auto'

		alias grep='grep --color=auto'
		alias fgrep='fgrep --color=auto'
		alias egrep='egrep --color=auto'
	fi

	# some more ls aliases
	alias ll='ls -alF'
	alias la='ls -A'
	alias l='ls -CF'

	### PATH to local scripts
	if [[ -z "$TMUX" ]]; then
		PATH_NEW=$HOME/.opt/bin
		if [ -d "$PATH_NEW" ]; then
			export PATH=$PATH_NEW${PATH:+:$PATH}
		fi
	fi

	### bash tab-completion scripts
	if [ -f "$HOME/.git-completion.bash" ]; then
		source $HOME/.git-completion.bash
	fi

	if [[ "$NERSC_HOST" == "pdsf"* ]] || [[ "$NERSC_HOST" == "cori"* ]]; then
		### Command prompt
		export PS1='\[\e[0;31m\]\u@\h:\w\$ \[\e[m\]'

		### Useful directories
		export SCRATCH=/project/projectdirs/cuore/scratch/michsakai
		export SIMULATION_CUORE=/project/projectdirs/cuore/syncData/CUORE_simulation

		### Functions
		function g++-diana {
			local filename=$(basename "$@")
			local executable=${filename%.*}
			g++ -std=c++11 -O2 -Wall -Wextra -Wshadow -I${BOOST_ROOT}/include -L${BOOST_ROOT}/lib -lboost_regex $(root-config --cflags --glibs) -o ${executable} "$@"
		}
		function g++-root {
			local filename=$(basename "$@")
			local executable=${filename%.*}
			g++ -std=c++11 -O2 -Wall -Wextra -Wshadow -I${BOOST_ROOT}/include -L${BOOST_ROOT}/lib -lboost_regex $(root-config --cflags --glibs) -lRooFit -lMinuit2 -I${BOOST_ROOT}/include -o ${executable} "$@"
		}

		### System installed software
		module load vim
		module load cmake
		module load git
		module load python3/3.7-anaconda-2019.07
		module load root/6.18.00-py3

		#if [[ "$NERSC_HOST" == "cori"* ]]; then
		#	LD_LIBRARY_PATH_NEW=$HOME/.opt/openssl/openssl-1.1.1/lib # libraries needed specifically for tmux
		#	if [[ -d "$LD_LIBRARY_PATH_NEW" ]]; then
		#		export LD_LIBRARY_PATH=$LD_LIBRARY_PATH_NEW${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}
		#	fi
		#fi

		### manually installed modules in Mich's home
		#module use /global/homes/m/mich/.opt/modulefiles

		#### libevent libraries
		#if [[ -z "$TMUX" ]]; then
		#	LD_LIBRARY_PATH_NEW=$HOME/.opt/libevent/libevent-2.1.8-stable/lib
		#	if [[ -d "$LD_LIBRARY_PATH_NEW" ]]; then
		#		export LD_LIBRARY_PATH=$LD_LIBRARY_PATH_NEW${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}
		#	fi
		#fi

		### gvfs-trash command variables
		export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
		alias trash='gio trash'

	elif [[ "$(hostname)" == "nino" ]]; then
		### Command prompt
		export PS1='\[\e[0;36m\]\u@\h:\w\$ \[\e[m\]'

		function compile-with-root {
			local filename=$(basename "${@: -1}")
			local executable=${filename%.*}
			g++ -std=c++11 -O2 -Wall -Wextra -pedantic -o ${executable} $(root-config --cflags) "$@" $(root-config --libs)
		}
		function compile-with-rat {
			local filename=$(basename "${@: -1}")
			local executable=${filename%.*}
			g++ -std=c++11 -O2 -Wall -Wextra -pedantic -o ${executable} -I${RATROOT}/include $(root-config --cflags) "$@" -L${RATROOT}/lib -lRATEvent $(root-config --libs)
		}

		### libevent libraries
		if [[ -z $TMUX ]]; then
			LD_LIBRARY_PATH_NEW=$HOME/.opt/libevent/libevent-2.1.8-stable/lib
			if [[ -d "$LD_LIBRARY_PATH_NEW" ]]; then
				export LD_LIBRARY_PATH=$LD_LIBRARY_PATH_NEW${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}
			fi
		fi

		### gvfs-trash command variables
		export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
		alias trash='gvfs-trash'
	fi

elif [[ "$OSTYPE" == "darwin"* ]]; then # MacOS
	### Alias for Docker
	alias doc_cuoresw='docker run -it --rm --mount type=bind,source="$HOME",destination=/root/michsakai,consistency=delegated -w="/root/michsakai" --entrypoint /bin/bash charstnut/docker-cuoreswbase /root/michsakai/Soft/docker_dev/cupid_mo_docker/entrypoint.sh'

	### Add brew related scripts into PATH
	export PATH=/usr/local/bin${PATH:+:$PATH}
	
	### Command prompt
	export PS1='\[\e[0;93m\]\u@\h:\w\$ \[\e[m\]'

	### Matplotlib
	export MATPLOTLIBRC=$HOME/.config/matplotlib

	### Colored terminal settings ###
	export CLICOLOR=1
	export LSCOLORS=GxFxCxDxBxegedabagaced

	### bash tab-completion scripts
	[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

	### PATH to local scripts
	PATH_NEW=$HOME/.opt/bin
	if [ -d "$PATH_NEW" ]; then
		export PATH=$PATH_NEW${PATH:+:$PATH}
	fi

	### Source thisroot.sh if exists
	THIS_ROOT=/usr/local/bin/thisroot.sh
	if [ -f "$THIS_ROOT" ]; then
		source "$THIS_ROOT"
		function compile-with-root {
			local filename=$(basename "${@: -1}")
			local executable=${filename%.*}
			g++ -std=c++11 -O2 -Wall -Wextra -pedantic -o ${executable} $(root-config --cflags) "$@" $(root-config --libs)
		}
	fi
fi

# Source local definitions
if [ -f $HOME/.bashrc_local ]; then
    source $HOME/.bashrc_local
fi

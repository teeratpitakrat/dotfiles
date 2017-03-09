# prompts
PROMPT='$(returned_value)$(username)$(hostname) $(shortened_current_dir) %# '
RPROMPT='$(current_dir)$(git_info)$(svn_info)$(tmux_session)$(current_time)'
setopt PROMPT_SUBST 			# allow substitution of parameters in PS1

# basic colors
COLOR_ROOT_USER="red"
COLOR_NORMAL_USER="green"
COLOR_HOSTNAME="yellow"
COLOR_CURRENT_DIR="green"
COLOR_CURRENT_DIR_READ_ONLY="yellow"
COLOR_CURRENT_DIR_NOT_EXIST="red"
COLOR_RETURNED_VALUE="red"
autoload -U colors && colors 	# enable colored prompt

# basic functions
username() {
	# Change color of username if it is root
	# %(x.true.false)
	# ! is true if the shell is privileged
	echo -n "%(!.%{$fg_bold[$COLOR_ROOT_USER]%}%n%{$reset_color%}.%{$fg_bold[$COLOR_NORMAL_USER]%}%n%{$reset_color%})"
}

hostname() {
	# Print hostname only for ssh sessions
	if [[ -n $SSH_CLIENT ]]; then
		echo -n "@%{$fg_bold[$COLOR_HOSTNAME]%}%m%{$reset_color%}"
	fi
}

returned_value() {
	# echo if the returned value is not 0
	echo -n "%(?,,%{${fg_bold[$COLOR_RETURNED_VALUE]}%}%? %{$reset_color%})"
}

shortened_current_dir() {
	if [[ -w $PWD ]]; then
		# green
		echo -n "%{$fg[$COLOR_CURRENT_DIR]%}%.%{$reset_color%}"
	elif [[ ! -d $PWD ]]; then
		# red
		echo -n "%{$fg[$COLOR_CURRENT_DIR_NOT_EXIST]%}%.%{$reset_color%}"
	else
		# yellow if the dir is read-only
		echo -n "%{$fg[$COLOR_CURRENT_DIR_READ_ONLY]%}%.%{$reset_color%}"
	fi
}

current_dir() {
	if [[ -w $PWD ]]; then
		# green
		echo -n "%{$fg[$COLOR_CURRENT_DIR]%}%~%{$reset_color%}"
	elif [[ ! -d $PWD ]]; then
		# red
		echo -n "%{$fg[$COLOR_CURRENT_DIR_NOT_EXIST]%}%~%{$reset_color%}"
	else
		# yellow if the dir is read-only
		echo -n "%{$fg[$COLOR_CURRENT_DIR_READ_ONLY]%}%~%{$reset_color%}"
	fi
}

setopt nohup	# do not kill backgrounded processes when zsh exits

# dir for all *.zsh files
dotfilesdir=$HOME/.dotfiles/zsh

for zshfile ($dotfilesdir/*.zsh); do
	source $zshfile
done

if hash tmuxinator 2>/dev/null; then
	source /usr/lib/ruby/gems/2.4.0/gems/tmuxinator-0.9.0/completion/tmuxinator.zsh
fi

if hash fasd 2>/dev/null; then
	eval "$(fasd --init auto)"
fi

if [[ -z "$TMUX" ]]; then # Do not start if this shell is already inside tmux
	if tty | fgrep pts; then # Do not start tmux if the shell is running in tty
		if hash tmux 2>/dev/null; then # Check if tmux is installed
			ID="`tmux ls | grep -vm1 attached | cut -d: -f1`" # get the id of a deattached session
			if [[ -z "$ID" ]] ;then # if not available create a new one
				tmux new-session
			else
				tmux attach-session -t "$ID" # if available attach to it
			fi
		fi
	fi
fi

# prompts
PROMPT='$(returned_value)$(username)$(hostname) %# '
RPROMPT='$(current_dir)$(git_info)$(svn_info)'
setopt PROMPT_SUBST 			# allow substitution of parameters in PS1

# basic colors
COLOR_ROOT_USER="red"
COLOR_NORMAL_USER="green"
COLOR_CURRENT_DIR="green"
COLOR_CURRENT_DIR_READ_ONLY="yellow"
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
		echo -n "@%m"
	fi
}

returned_value() {
	# echo if the returned value is not 0
	echo -n "%(?,,%{${fg_bold[$COLOR_RETURNED_VALUE]}%}%? %{$reset_color%})"
}

current_dir() {
	if [[ -w $PWD ]]; then
		# green
		echo -n "%{$fg[$COLOR_CURRENT_DIR]%}%~%{$reset_color%}"
	else
		# yellow if the dir is read-only
		echo -n "%{$fg[$COLOR_CURRENT_DIR_READ_ONLY]%}%~%{$reset_color%}"
	fi
}

# dir for all *.zsh files
dotfilesdir=$HOME/.dotfiles/zsh

for zshfile ($dotfilesdir/*.zsh); do
	source $zshfile
done

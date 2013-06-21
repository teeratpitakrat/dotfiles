# prompts
PROMPT='$(returned_value)$(username)$(hostname) %# '
RPROMPT='$(current_dir)$(git_info)$(svn_info)'
setopt PROMPT_SUBST 			# allow substitution of parameters in PS1

# colors
COLOR_ROOT_USER="red"
COLOR_CURRENT_DIR="green"
COLOR_CURRENT_DIR_READ_ONLY="yellow"
COLOR_RETURNED_VALUE="red"
COLOR_GIT_BRANCH="blue"
COLOR_GIT_STATUS="red"
COLOR_SVN_REPO="blue"
COLOR_SVN_STATUS="red"
autoload -U colors && colors 	# enable colored prompt

username() {
	# Change color of username if it is root
	# %(x.true.false)
	# ! is true if the shell is privileged
	echo -n "%(!.%{$fg_bold[$COLOR_ROOT_USER]%}%n%{$reset_color%}.%n)"
}

hostname() {
	# Print hostname only for ssh sessions
	if [[ -n $SSH_CLIENT ]]; then
		echo -n "@%m"
	fi
}

returned_value() {
	echo -n "%{${fg_bold[$COLOR_RETURNED_VALUE]}%}%(?,,%? )%{$reset_color%}"
}

current_dir() {
	if [[ -w $PWD ]]; then
		echo -n "%{$fg[$COLOR_CURRENT_DIR]%}%~%{$reset_color%}"
	else
		echo -n "%{$fg[$COLOR_CURRENT_DIR_READ_ONLY]%}%~%{$reset_color%}"
	fi
}

########################################################################
# git
GIT_STATUS_BEHIND="%{$fg_bold[$COLOR_GIT_STATUS]%}<%{$reset_color%}"
GIT_STATUS_UNTRACKED="%{$fg_bold[$COLOR_GIT_STATUS]%}?%{$reset_color%}"
GIT_STATUS_CHANGES="%{$fg_bold[$COLOR_GIT_STATUS]%}!%{$reset_color%}"
GIT_STATUS_STAGED="%{$fg_bold[$COLOR_GIT_STATUS]%}+%{$reset_color%}"
GIT_STATUS_AHEAD="%{$fg_bold[$COLOR_GIT_STATUS]%}>%{$reset_color%}"

git_info() {
	ref=$(git symbolic-ref HEAD 2> /dev/null) || \
		ref=$(git rev-parse --short HEAD 2> /dev/null) || return
	echo -n " %{$fg_bold[$COLOR_GIT_BRANCH]%}($(git_current_branch))%{$reset_color%}$(git_status)"
}

git_current_branch() {
	git_ref=$(git symbolic-ref HEAD 2> /dev/null) || return
	git_branch=${ref#refs/heads/}
	echo -n $git_branch
}

git_status () {
	gitstat=$(git status 2>/dev/null | grep '\(# Your branch is behind\|# Untracked\|# Changes\|# Changed but not updated:\)')
	echo -n " "
	#$(git remote update) || return		# takes too long, do it manually!
	# Check behind
	if [[ $(echo ${gitstat} | grep -c "^# Your branch is behind") > 0 ]]; then
		echo -n "$GIT_STATUS_BEHIND"
	fi
	# Check untracked files
	if [[ $(echo ${gitstat} | grep -c "^\(# Untracked files:\|# Changed but not updated:\)$") > 0 ]]; then
		echo -n "$GIT_STATUS_UNTRACKED"
	fi
	# Check changes to tracked files
	if [[ $(echo ${gitstat} | grep -c "^\(# Changes not staged for commit:\)$") > 0 ]]; then
		echo -n "$GIT_STATUS_CHANGES"
	fi
	# Check staged files
	if [[ $(echo ${gitstat} | grep -c "^# Changes to be committed:$") > 0 ]]; then
		echo -n "$GIT_STATUS_STAGED"
	fi
	# Check ahead
	if $(echo "$(git log origin/$(git_current_branch)..HEAD 2> /dev/null)" | grep '^commit' &> /dev/null); then
		echo -n "$GIT_STATUS_AHEAD"
	fi
}

########################################################################
# svn
SVN_STATUS_UNTRACKED="%{$fg_bold[$COLOR_SVN_STATUS]%}?%{$reset_color%}"
SVN_STATUS_CHANGES="%{$fg_bold[$COLOR_SVN_STATUS]%}!%{$reset_color%}"

svn_info() {
	ref=$(svn info 2> /dev/null) || return
	echo -n " %{$fg_bold[$COLOR_SVN_REPO]%}[$(svn_repo)]%{$reset_color%}%{$fg_bold[$COLOR_SVN_STATUS]%}$(svn_status)%{$reset_color%}"
}

svn_repo() {
	svnrepo=$(svn info | sed -n 's/Repository\ Root:\ .*\///p')
	echo -n "$svnrepo"
}

svn_status () {
	svnstat=$(svn status 2>/dev/null | grep '^\(?\|M\|A\)')
	echo -n " "
	# Check untracked files
	if [[ $(echo ${svnstat} | grep -c "^\(?\)") > 0 ]]; then
		echo -n "$SVN_STATUS_UNTRACKED"
	fi
	# Check changes
	if [[ $(echo ${svnstat} | grep -c "^\(M\|A\)") > 0 ]]; then
		echo -n "$SVN_STATUS_CHANGES"
	fi
}

########################################################################
# misc
export EDITOR=/usr/bin/vim
export PATH=$PATH:~/bin
export GREP_OPTIONS='--color=auto'	# add color to grep
export GREP_COLOR='1;32'			# green color
REPORTTIME=10	# display cpu usage stats for commands taking more than 10 seconds
#bindkey -v		# use vi-mode in the shell
bindkey -e		# use emacs mode in the shell
bindkey '^[[A' up-line-or-search	# up arrow will search for the same command
bindkey '^[[B' down-line-or-search	# down arrow will search for the same command
bindkey "^[[1;5C" emacs-forward-word	#control left
bindkey "^[[1;5D" backward-word			#control right
bindkey "^[OH" beginning-of-line		# home
bindkey "^[OF" end-of-line				# end
bindkey '^R' history-incremental-search-backward	# enable Ctrl+R to search history
bindkey '\e.' insert-last-word		# Alt+. to repeat the last part of previous command
bindkey "\e[3~" delete-char			# enable delete key for gnome-terminal

# Ctrl+w deletes last word before '/'
autoload -U select-word-style
select-word-style bash

# Shows red dots while waiting for completion
expand-or-complete-with-dots() {
	echo -n "\e[31m......\e[0m"
	zle expand-or-complete
	zle redisplay
}
zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots

# kill
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u `whoami` -o pid,user,comm -w -w"

#autoload -U compinit promptinit
#compinit
#promptinit

# Load and run compinit
autoload -U compinit
compinit -i

# completion
unsetopt menu_complete   # do not autoselect the first completion entry
unsetopt flowcontrol
setopt auto_menu         # show completion menu on succesive tab press
setopt complete_in_word
setopt always_to_end
# case-insensitive (all),partial-word and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' \
	'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# use /etc/hosts and known_hosts for hostname completion
[ -r /etc/ssh/ssh_known_hosts ] && _global_ssh_hosts=(${${${${(f)"$(</etc/ssh/ssh_known_hosts)"}:#[\|]*}%%\ *}%%,*}) || _global_ssh_hosts=()
[ -r ~/.ssh/known_hosts ] && _ssh_hosts=(${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[\|]*}%%\ *}%%,*}) || _ssh_hosts=()
[ -r ~/.ssh/config ] && _ssh_config=($(cat ~/.ssh/config | sed -ne 's/Host[=\t ]//p')) || _ssh_config=()
[ -r /etc/hosts ] && : ${(A)_etc_hosts:=${(s: :)${(ps:\t:)${${(f)~~"$(</etc/hosts)"}%%\#*}##[:blank:]#[^[:blank:]]#}}} || _etc_hosts=()
hosts=(
"$_ssh_config[@]"
"$_global_ssh_hosts[@]"
"$_ssh_hosts[@]"
"$_etc_hosts[@]"
"$HOST"
localhost
)
zstyle ':completion:*:hosts' hosts $hosts
zstyle ':completion:*' users off

# keyboard
alias setmykey='setxkbmap -option grp:switch,grp:shift_caps_toggle,grp_led:scroll dvorak,th'
alias setuskey='setxkbmap us'
alias setdekey='setxkbmap -layout de -variant nodeadkeys'
alias setthkey='setxkbmap -option grp:shift_caps_toggle,grp_led:scroll us,th'

# history
HISTFILE=~/.zsh_history
HISTSIZE=SAVEHIST=1000000
#setopt append_history
#setopt inc_append_history
setopt share_history
setopt extended_history
setopt hist_verify		# do not directly execute command with !!

########################################################################
# aliases
# misc
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -la'
alias ev='evince'

# suffix aliases
#alias -s pdf=evince

# global aliases
#alias -g G='| grep'
#alias -g L='| less'

# arch
alias y='yaourt'

# git
alias gst='git status'
alias gss='git status -s'
alias gd='git diff'
alias gru='git remote update'
alias gpl='git pull'
#alias gup='git pull --rebase'
alias gm='git merge'
alias gp='git push'
alias gd='git diff'
alias ga='git add'
alias gc='git commit -v'
#alias gc!='git commit -v --amend'
alias gca='git commit -v -a'
#alias gca!='git commit -v -a --amend'
alias gco='git checkout'
alias gcom='git checkout master'
alias gr='git remote'
alias grv='git remote -v'
#alias grup='git remote update'
alias gb='git branch'
alias gba='git branch -a'
#alias gcount='git shortlog -sn'
alias gcl='git config --list'
#alias gcp='git cherry-pick'
#alias glg='git log --stat --max-count=5'
alias glgg='git log --graph --max-count=5'
alias glgga='git log --graph --decorate --all'
alias glo='git log --oneline'
#alias grh='git reset HEAD'
#alias grhh='git reset HEAD --hard'
#alias gwc='git whatchanged -p --abbrev-commit --pretty=medium'
alias gf='git ls-files | grep'
#alias gpoat='git push origin --all && git push origin --tags'

# svn
alias sup='svn up'
alias sst='svn status'
alias sa='svn add'
alias sc='svn commit'
alias sl='svn log -l'

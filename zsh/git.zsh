GIT_COLOR_BRANCH="blue"
GIT_COLOR_STATUS="red"

GIT_STATUS_BEHIND="%{$fg_bold[$GIT_COLOR_STATUS]%}<%{$reset_color%}"
GIT_STATUS_UNTRACKED="%{$fg_bold[$GIT_COLOR_STATUS]%}?%{$reset_color%}"
GIT_STATUS_CHANGES="%{$fg_bold[$GIT_COLOR_STATUS]%}M%{$reset_color%}"
GIT_STATUS_STAGED="%{$fg_bold[$GIT_COLOR_STATUS]%}S%{$reset_color%}"
GIT_STATUS_AHEAD="%{$fg_bold[$GIT_COLOR_STATUS]%}>%{$reset_color%}"

git_info() {
	ref=$(git symbolic-ref HEAD 2> /dev/null) || ref=$(git rev-parse --short HEAD 2> /dev/null) || return
	echo -n " $(git_current_branch)$(git_status)"
}

git_current_branch() {
	git_ref=$(git symbolic-ref HEAD 2> /dev/null) || return
	git_branch=${ref#refs/heads/}
	echo -n "%{$fg_bold[$GIT_COLOR_BRANCH]%}($git_branch)%{$reset_color%}"
}

git_status () {
	gitstat=$(git status 2>/dev/null | grep '\(# Your branch is behind\|# Untracked\|# Changes\|# Changed but not updated:\)') || return
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

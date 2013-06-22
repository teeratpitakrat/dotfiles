GIT_COLOR_BRANCH="blue"
GIT_COLOR_STATUS="red"

GIT_STATUS_BEHIND="%{$fg_bold[$GIT_COLOR_STATUS]%}<%{$reset_color%}"
GIT_STATUS_UNTRACKED="%{$fg_bold[$GIT_COLOR_STATUS]%}?%{$reset_color%}"
GIT_STATUS_CHANGES="%{$fg_bold[$GIT_COLOR_STATUS]%}M%{$reset_color%}"
GIT_STATUS_STAGED="%{$fg_bold[$GIT_COLOR_STATUS]%}S%{$reset_color%}"
GIT_STATUS_AHEAD="%{$fg_bold[$GIT_COLOR_STATUS]%}>%{$reset_color%}"

git_info() {
	GIT_REF=$(git symbolic-ref HEAD 2> /dev/null) || return
	echo -n " $(git_current_branch)$(git_status)"
}

git_current_branch() {
	GIT_BRANCH=${GIT_REF#refs/heads/}
	echo -n "%{$fg_bold[$GIT_COLOR_BRANCH]%}$GIT_BRANCH%{$reset_color%}"
}

git_status () {
	gitstat=$(git status 2>/dev/null | grep '\(# Your branch is behind\|# Untracked\|# Changes\|# Changed but not updated:\|# Your branch is ahead of\)') || return
	echo -n " "
	#$(git remote update) || return		# takes too long, do it manually!
	# Check behind
	if echo $gitstat | grep -q "^# Your branch is behind" ; then
		echo -n "$GIT_STATUS_BEHIND"
	fi
	# Check untracked files
	if echo ${gitstat} | grep -q "^\(# Untracked files:\|# Changed but not updated:\)$" ; then
		echo -n "$GIT_STATUS_UNTRACKED"
	fi
	# Check changes to tracked files
	if echo ${gitstat} | grep -q "^\(# Changes not staged for commit:\)$" ; then
		echo -n "$GIT_STATUS_CHANGES"
	fi
	# Check staged files
	if echo ${gitstat} | grep -q "^# Changes to be committed:$" ; then
		echo -n "$GIT_STATUS_STAGED"
	fi
	# Check ahead
	if echo ${gitstat} | grep -q "^# Your branch is ahead of" ; then
		echo -n "$GIT_STATUS_AHEAD"
	fi
}

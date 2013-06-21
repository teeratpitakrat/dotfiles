SVN_COLOR_REPO="blue"
SVN_COLOR_STATUS="red"

SVN_STATUS_UNTRACKED="%{$fg_bold[$SVN_COLOR_STATUS]%}?%{$reset_color%}"
SVN_STATUS_CHANGES="%{$fg_bold[$SVN_COLOR_STATUS]%}!%{$reset_color%}"

svn_info() {
	ref=$(svn info 2> /dev/null) || return
	echo -n " %{$fg_bold[$SVN_COLOR_REPO]%}[$(svn_repo)]%{$reset_color%}%{$fg_bold[$SVN_COLOR_STATUS]%}$(svn_status)%{$reset_color%}"
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

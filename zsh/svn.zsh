SVN_COLOR_REPO="blue"
SVN_COLOR_STATUS="red"

SVN_STATUS_UNTRACKED="%{$fg_bold[$SVN_COLOR_STATUS]%}?%{$reset_color%}"
SVN_STATUS_CHANGES="%{$fg_bold[$SVN_COLOR_STATUS]%}M%{$reset_color%}"

svn_info() {
	SVN_INFO=$(svn info 2> /dev/null) || return
	echo -n " $(svn_repo)$(svn_status)"
}

svn_repo() {
	SVN_REPO=$(echo $SVN_INFO | sed -n 's/Repository\ Root:\ .*\///p')
	echo -n "%{$fg_bold[$SVN_COLOR_REPO]%}${SVN_REPO}%{$reset_color%}"
}

svn_status () {
	svnstat=$(svn status 2>/dev/null | grep '^\(?\|M\|A\)') || return
	echo -n " "
	# Check untracked files
	if echo ${svnstat} | grep -q "^\(?\)" ; then
		echo -n "$SVN_STATUS_UNTRACKED"
	fi
	# Check changes
	if echo ${svnstat} | grep -q "^\(M\|A\)" ; then
		echo -n "$SVN_STATUS_CHANGES"
	fi
}

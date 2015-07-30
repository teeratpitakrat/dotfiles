TMUX_COLOR_DETACHED_SESSION="cyan"

tmux_session() {
	if which tmux > /dev/null; then
		numDetachedSessions=$(tmux ls 2>/dev/null | grep -v "attached" | wc -l)
		if [[ $numDetachedSessions -ge 1 ]]; then
			echo -n " %{$fg_bold[$TMUX_COLOR_DETACHED_SESSION]%}$numDetachedSessions%{$reset_color%}"
		fi
	fi
}

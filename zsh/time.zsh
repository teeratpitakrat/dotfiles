TIME_COLOR="yellow"

current_time() {
	echo -n " %{$fg[$TIME_COLOR]%}$(date +%H:%M)%{$reset_color%}"
}

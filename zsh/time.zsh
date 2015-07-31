TIME_COLOR="yellow"

current_time() {
	echo -n " %{$fg[$TIME_COLOR]%}%T%{$reset_color%}"
}

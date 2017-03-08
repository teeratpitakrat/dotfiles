rg() {
	if [ -z "$RANGER_LEVEL" ]
	then
		ranger
	else
		exit
	fi
}

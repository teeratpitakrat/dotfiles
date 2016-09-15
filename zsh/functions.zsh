cpbk() {
	date=`date +%Y%m%d-%H%M%S`
	bkfile="$1.bak-$date"
	if [[ -a $bkfile ]]; then
		echo "File or directory already exists"
	fi
	cp -a $1 $bkfile
	echo "Copied $1 to $bkfile"
}

mvbk() {
	date=`date +%Y%m%d-%H%M%S`
	bkfile="$1.bak-$date"
	if [[ -a $bkfile ]]; then
		echo "File or directory already exists"
	fi
	mv $1 $bkfile
	echo "Moved $1 to $bkfile"
}

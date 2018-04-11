export EDITOR=/usr/bin/nvim
export PATH=$PATH:~/bin
export PATH=$PATH:~/gsutil			# Add path to gsutil (google cloud storage tool)
export PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"
#export GREP_OPTIONS='--color=auto'	# add color to grep
unset GREP_OPTIONS
export GREP_COLOR='1;36'			# green color
export PULSE_LATENCY_MSEC=60		# fix distorted sound for skype
export GOPATH=~/go
export PATH="$PATH:$GOPATH/bin"

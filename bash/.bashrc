#command cowsay $(fortune)

# Check for an interactive session
[ -z "$PS1" ] && return

alias ls='ls --color=auto --group-directories-first'
alias ll='ls -lp'
alias la='ls -lpa'
alias lh='ls -lph'
alias lt='ls -lpatr'
alias screen='screen -h 200000'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'
alias ........='cd ../../../../../../..'
alias .........='cd ../../../../../../../..'

alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'
alias ..5='cd ../../../../..'
alias ..6='cd ../../../../../..'
alias ..7='cd ../../../../../../..'
alias ..8='cd ../../../../../../../..'

alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias cd.....='cd ../../../..'
alias cd......='cd ../../../../..'
alias cd.......='cd ../../../../../..'
alias cd........='cd ../../../../../../..'
alias cd.........='cd ../../../../../../../..'

alias grep='grep --color=auto'
alias xterm='xterm -fg white -bg black -fa monospace -fs 10 -sl 10000'
alias setmykey='setxkbmap -option grp:switch,grp:shift_caps_toggle,grp_led:scroll dvorak,th'
alias setuskey='setxkbmap us'
alias setdekey='setxkbmap -layout de -variant nodeadkeys'
alias setthkey='setxkbmap -option grp:shift_caps_toggle,grp_led:scroll us,th'

# git
alias gst='git status'
alias gss='git status -s'
alias gd='git diff'
alias gru='git remote update'
alias gpl='git pull'
alias gup='git pull --rebase'
alias gm='git merge'
alias gp='git push'
alias gd='git diff'
alias ga='git add'
alias gc='git commit -v'
#alias gc!='git commit -v --amend'
alias gca='git commit -v -a'
#alias gca!='git commit -v -a --amend'
alias gco='git checkout'
alias gcom='git checkout master'
alias gr='git remote'
alias grv='git remote -v'
#alias grup='git remote update'
alias gb='git branch'
alias gba='git branch -a'
#alias gcount='git shortlog -sn'
alias gcl='git config --list'
#alias gcp='git cherry-pick'
#alias glg='git log --stat --max-count=5'
#alias glgg='git log --graph --max-count=5'
#alias glgga='git log --graph --decorate --all'
alias glg='git log --graph --decorate --all'
alias glo='git log --oneline'
#alias grh='git reset HEAD'
#alias grhh='git reset HEAD --hard'
#alias gwc='git whatchanged -p --abbrev-commit --pretty=medium'
alias gf='git ls-files | grep'
#alias gpoat='git push origin --all && git push origin --tags'

PS1='\[\e[1;31m\]$(last_returned_value)\[\e[0m\]\[\e[1;32m\]\u\[\e[0m\]@\[\e[1;33m\]\h\[\e[0m\] \[\e[0;32m\]\W\[\e[0m\]$(parse_git_branch) \$ '

last_returned_value() {
	LAST_RETURNED_VALUE=$?
	if [[ $LAST_RETURNED_VALUE != 0 ]]; then
		echo "$LAST_RETURNED_VALUE "
	fi
}

parse_git_branch() {
	BRANCH=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ <\1>/')
	if git status 2> /dev/null | grep --quiet 'Untracked files\|Changes not staged for commit\|Changes to be committed'
	then
		STATUS=$(echo -e "\x2a")
	fi
	printf "$BRANCH$STATUS"
  }

complete -cf sudo
complete -cf gksu
complete -cf kdesu
complete -cf man
complete -cf clyde
complete -cf killall
complete -cf screen
complete -cf which
complete -cf proxychains

export HISTSIZE=9999999
export HISTFILESIZE=99999999
export HISTTIMEFORMAT='%d/%m/%Y %H:%M:%S '
export EDITOR="vim"
export PATH=$PATH:~/bin/

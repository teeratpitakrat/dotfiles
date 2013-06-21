# misc
alias ls='ls --color=auto'
alias ll='ls -lp'
alias la='ls -lpa'
alias lh='ls -lph'
alias lt='ls -lpatr'

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

# suffix aliases
#alias -s pdf=evince

# global aliases
#alias -g G='| grep'
#alias -g L='| less'

# apps
alias ev='evince'

# arch
alias y='yaourt'

# keymap
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
#alias gup='git pull --rebase'
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
alias glgg='git log --graph --max-count=5'
alias glgga='git log --graph --decorate --all'
alias glo='git log --oneline'
#alias grh='git reset HEAD'
#alias grhh='git reset HEAD --hard'
#alias gwc='git whatchanged -p --abbrev-commit --pretty=medium'
alias gf='git ls-files | grep'
#alias gpoat='git push origin --all && git push origin --tags'

# svn
alias sup='svn up'
alias sss='svn status'
alias sa='svn add'
alias sc='svn commit'
alias sl='svn log -l'

# ssh
alias zeus='ssh zeus'
alias pi='ssh pi'
alias brisbane='ssh brisbane'
alias brisbane-mildura='ssh brisbane-mildura'
alias adelaide='ssh adelaide'

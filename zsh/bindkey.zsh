bindkey -e		# use emacs mode in the shell
bindkey '^[[A' up-line-or-search	# up arrow will search for the same command
bindkey '^[[B' down-line-or-search	# down arrow will search for the same command
bindkey "^[[1;5C" emacs-forward-word	#control left
bindkey "^[[1;5D" backward-word			#control right
bindkey '^[OH' beginning-of-line		# home
bindkey '^[OF' end-of-line				# end
bindkey '^R' history-incremental-search-backward	# enable Ctrl+R to search history
bindkey '\e.' insert-last-word		# Alt+. to repeat the last part of previous command
bindkey "\e[3~" delete-char			# enable delete key for gnome-terminal

# Ctrl+w deletes last word before '/'
autoload -U select-word-style
select-word-style bash

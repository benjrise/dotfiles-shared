#!/bin/bash
export EDITOR=vimexport
export FCEDIT=vim
set -o vi

# Make history work sensibly
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss

shopt -s histappend # Append to the history file, don't overwrite it
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
export HISTCONTROL=ignoredups:erasedups



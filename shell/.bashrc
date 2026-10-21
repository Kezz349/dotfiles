#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# 420-3A6: aliases et fonctions versionnes dans ~/dotfiles
if [ -f "$HOME/dotfiles/shell/aliases.sh" ]; then
. "$HOME/dotfiles/shell/aliases.sh"
fi

# Fichier commun a Bash et Zsh, charge depuis .bashrc ou .zshrc.
alias ..='cd ..'
alias ...='cd ../..'
alias la='ls -a'
alias ll='ls -alF'
alias gs='git status --short'
alias gl='git log --oneline --decorate -10'

mkcd() {
    if [ "$#" -ne 1 ]; then
        printf 'Usage: mkcd NOM_DOSSIER\n' >&2
        return 2
    fi
    mkdir -p -- "$1" && cd -- "$1"
}

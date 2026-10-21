# Fichier commun a Bash et Zsh, charge depuis .bashrc ou .zshrc.
alias ..='cd ..'
alias ...='cd ../..'
alias la='ls -a'
alias ll='ls -alF'
alias gs='git status'
alias gl='git log --oneline --decorate -10'

export PATH="$HOME/.local/bin:$PATH"

mkcd() {
    if [ "$#" -ne 1 ]; then
        printf 'Usage: mkcd NOM_DOSSIER\n' >&2
        return 2
    fi
    mkdir -p -- "$1" && cd -- "$1"
}

gitpush() {
  git rev-parse --is-inside-work-tree >/dev/null 2>&1 || {
    echo "Not inside a Git repository." >&2
    return 1
  }

  changes=$(git status --porcelain) || return 1
  if [[ -z "$changes" ]]; then
    echo "No changes to commit."
    return 0
  fi

  git add -A &&
  git commit -m "$(date '+%Y-%m-%d %H:%M:%S')" &&
  git push
}

gitpull() {
  git rev-parse --is-inside-work-tree >/dev/null 2>&1 || {
    echo "Not inside a Git repository." >&2
    return 1
  }

  git fetch || return 1

  local upstream behind
  upstream=$(git rev-parse --abbrev-ref --symbolic-full-name '@{u}' 2>/dev/null) || {
    echo "This branch has no upstream branch configured." >&2
    return 1
  }

  behind=$(git rev-list --count "HEAD..$upstream") || return 1

  if [[ "$behind" -eq 0 ]]; then
    echo "No new commits found. Already up to date."
    return 0
  fi

  echo "Found $behind new commit(s). Pulling..."
  git pull --ff-only
}

newc() {
  if (( $# > 1 )); then
    echo "Usage: newc [filename]" >&2
    return 2
  fi

  local file="${1:-main.c}"
  [[ "$file" == *.c ]] || file="${file}.c"
  touch "$file" && code "$file"
}

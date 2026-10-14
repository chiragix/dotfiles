# Standard listing
alias ls='eza --icons=auto --color=auto --group-directories-first'

# Detailed listing
alias ll='eza -lhbg --icons=auto --color=auto --git --group-directories-first'

# Detailed hidden listing
alias la='eza -lahbg --icons=auto --color=auto --git --group-directories-first'

# Tree view
alias tree='eza --tree --icons=auto --color=auto --level=2 --group-directories-first'

# Reuse ls completions for eza
compdef eza=ls

# =========================================================
# Navigation
# =========================================================

alias -- -='cd -' # -- prevents - being parsed as a flag; cd - jumps to previous directory

lf() { # zsh follow lf navigation
  tmp=$(mktemp)
  command lf -last-dir-path="$tmp" "$@"
  if [ -f "$tmp" ]; then
    dir=$(cat "$tmp")
    rm -f "$tmp"
    [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
  fi
}

# =========================================================
# Editor
# =========================================================

alias vim='nvim'
alias v='nvim'

if command -v bat >/dev/null 2>&1; then
  alias cat="bat --paging=never --style=plain"
fi

# =========================================================
# Git
# =========================================================

alias config='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias gs='git status'
alias gss='git status -s'
alias ga='git add'
alias gc='git commit'
alias gcm='git commit -m'
alias gl='git log --oneline --graph --parents -20'
alias gsw='git switch'
alias gswc='git switch -c'
alias gb='git branch'
alias gd='git diff'
alias gp='git push'


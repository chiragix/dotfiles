# ~/.config/zsh/.zshenv

# ---------- XDG base directories ----------
# Centralizes config/cache/data locations
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# ---------- Editor ----------
# Default editor used by git, crontab, etc.
export EDITOR="nvim"
export VISUAL="nvim"

# ---------- Pager ----------
if command -v bat >/dev/null 2>&1; then
  export BAT_PAGER="less -RF"                    # bat's OWN internal pager — must not be bat itself
  export PAGER="bat --paging=auto --style=plain"
  export LESS="-RF"
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
fi

# ---------- GPG ----------
export GPG_TTY=$(tty)

# ---------- Starship ----------
export STARSHIP_CONFIG="$ZDOTDIR/starship.toml"

# ---------- PATH ----------
typeset -U path

# Homebrew
export PATH="/opt/homebrew/bin:$PATH"

# Personal binaries/scripts
export PATH="$HOME/.local/bin:$PATH"

# go
export PATH=$PATH:$HOME/go/bin


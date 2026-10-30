# ~/.config/zsh/fzf.zsh

# ---------- fzf ----------

_FZF_FD_BASE='fd --type f --strip-cwd-prefix'

# Default fzf: include hidden files, exclude .git
export FZF_DEFAULT_COMMAND="$_FZF_FD_BASE --hidden --exclude .git"

# Ctrl-T: same search behavior
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# UI
export FZF_DEFAULT_OPTS='
  --tmux=center,80%,60%
  --layout=default
  --border=rounded
  --prompt="❯ "
  --pointer="▌"
  --preview-window=right:50%:wrap:border-left
'

_FZF_PREVIEW_CMD='bat --color=always --style=numbers --line-range=:500 {}'
export FZF_CTRL_T_OPTS="--preview '$_FZF_PREVIEW_CMD'"

# Ctrl+F: file picker excluding hidden files
_fzf_file_no_hidden() {
  local FZF_CTRL_T_COMMAND="$_FZF_FD_BASE"
  fzf-file-widget
}

zle -N _fzf_file_no_hidden

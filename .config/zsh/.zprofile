# ~/.config/zsh/.zprofile

# ---------- ssh-add ----------
if ! /usr/bin/ssh-add -l >/dev/null 2>&1; then
  /usr/bin/ssh-add --apple-load-keychain >/dev/null 2>&1
fi

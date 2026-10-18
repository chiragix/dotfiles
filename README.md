# dotfiles

Personal configuration files, tracked with a bare git repo whose work tree is $HOME.

## Starting from scratch

```zsh
git init --bare $HOME/.dotfiles
alias config='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
echo "alias config='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.config/zsh/aliases.zsh
```

## Installing your dotfiles onto a new system

**1. Clone your dotfiles into a [bare](https://www.saintsjd.com/2011/01/what-is-a-bare-git-repository/) repository in a "dot" folder of your `$HOME`:**

```zsh
git clone --bare https://github.com/chiragix/dotfiles.git ~/.config/zsh $HOME/.dotfiles
``` 

**2. Point zsh at the config directory**

Add the following to `/etc/zshenv` (MacOS specific path):

```zsh
if [[ -z "$XDG_CONFIG_HOME" ]]
then
    export XDG_CONFIG_HOME="$HOME/.config"
fi

if [[ -d "$XDG_CONFIG_HOME/zsh" ]]
then
    export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
fi
```

Create required directories:

```zsh
mkdir -p ~/.local/state/zsh   # history
mkdir -p ~/.cache/zsh         # completion cache
```

Restart your terminal to load the configs.

**4. Download Homebrew package manager**

Download homebrew:

```zsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install your cask and formulas from brew bundle:

```zsh
brew bundle install
```
Again restart your terminal.

## Usage

`$HOME` folder can be versioned with normal commands, replacing git with your newly created config alias, like:

```zsh
config status
config add .zshrc
config commit -m "Add zshrc"
config push
```

## Additional Fixes

**1. Tmux plugin manager download**

```zsh
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
```

**2. Git commit signing and ssh setup**

Setup ssh key for git authenticating and commit signing. 
Also add those keys to macos keychain using the following command:

```zsh
ssh-add --apple-use-keychain ~/.ssh/id_ed25519
ssh-add --apple-use-keychain ~/.ssh/id_ed25519_signing
```

## Credits

- **[Atlassian](https://www.atlassian.com/git/tutorials/dotfiles)**: the bare Git repository method to manage dotfile.
- **[Radley Lewis](https://github.com/radleylewis/)**: the structure for my zsh, nvim and tmux configurations.
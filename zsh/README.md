# Zsh Configuration

Personal Zsh shell configuration with Oh-My-Zsh and Powerlevel10k.

## Overview

Main features:

- Framework: Oh-My-Zsh with curated plugin set
- Theme: Powerlevel10k with icons, git status, transient right prompt
- Plugins: `git`, `z`, `extract`, `sudo`, `zsh-autosuggestions`, `zsh-syntax-highlighting`
- History: 10000 entries, shared across sessions, no duplicates
- Aliases: common ls shortcuts, directory navigation, grep with color
- Keybindings: emacs mode, history search, line editing in $EDITOR
- Environment: PATH guard for `~/.local/bin`, `EDITOR=nvim`

## Directory layout

```text
~/gitrepos/dotfiles/zsh
├── README.md
├── .zshrc
├── .zshenv
└── .p10k.zsh
```

Active config targets:

```text
~/.zshrc      -> ~/gitrepos/dotfiles/zsh/.zshrc
~/.zshenv     -> ~/gitrepos/dotfiles/zsh/.zshenv
~/.p10k.zsh   -> ~/gitrepos/dotfiles/zsh/.p10k.zsh
```

## Install

Zsh must be available on the system:

```bash
zsh --version
```

On Debian or Ubuntu machines where zsh is missing:

```bash
sudo apt update
sudo apt install zsh
```

The repository bootstrap does not run `sudo`; it only links configuration
files and installs external dependencies (Oh-My-Zsh, Powerlevel10k, plugins)
idempotently.

## Activate

Create or refresh the links from the repository root:

```bash
bin/bootstrap
```

Then start a new Zsh session:

```bash
zsh
```

Or make Zsh the default login shell:

```bash
chsh -s /usr/bin/zsh
```

## Prerequisites

- **Nerd Font** — required for Powerlevel10k icons. Install a Nerd Font
  (e.g., JetBrainsMono Nerd Font, Meslo Nerd Font) and configure your
  terminal emulator to use it. This module does not install fonts
  automatically (OS-specific).

## Aliases

```text
ll            ls -la
la            ls -A
l             ls -l
..            cd ..
...           cd ../..
vim           nvim
grep          grep --color=auto
cat           bat --style=plain  (only if bat is installed)
```

## Keybindings

Emacs keybinding mode is the default.

### History

```text
Ctrl+r        reverse incremental history search
Ctrl+s        forward incremental history search
Up arrow      search history or navigate up
Down arrow    search history or navigate down
```

### Line editing

```text
Ctrl+e        edit current line in $EDITOR
Ctrl+x Ctrl+e edit current line in $EDITOR
```

## History

- 10000 entries saved and searchable
- Shared across sessions (`SHARE_HISTORY`)
- No duplicate entries
- Timestamps recorded (`EXTENDED_HISTORY`)
- Appended incrementally (not on shell exit)

## Health Checks

Syntax validation:

```bash
zsh -n ~/.zshrc
```

Symlink verification:

```bash
test -L ~/.zshrc && echo "ok" || echo "broken"
test -L ~/.zshenv && echo "ok" || echo "broken"
test -L ~/.p10k.zsh && echo "ok" || echo "broken"
```

External dependencies:

```bash
test -d ~/.oh-my-zsh && echo "OMZ ok" || echo "OMZ missing"
test -d ~/.p10k && echo "p10k ok" || echo "p10k missing"
test -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions && echo "autosuggestions ok" || echo "autosuggestions missing"
test -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting && echo "syntax-highlighting ok" || echo "syntax-highlighting missing"
```

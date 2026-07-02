# Zsh Configuration

Personal Zsh shell configuration with Oh-My-Zsh and Powerlevel10k.

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

Expected config targets:

```text
~/.zshrc  -> ~/gitrepos/dotfiles/zsh/.zshrc
~/.zshenv -> ~/gitrepos/dotfiles/zsh/.zshenv
```

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
  and configure your terminal to use it. This module does not install
  fonts automatically (OS-specific).

## Health Checks

Syntax validation:

```bash
zsh -n ~/.zshrc
```

Symlink verification:

```bash
test -L ~/.zshrc && echo "ok" || echo "broken"
test -L ~/.zshenv && echo "ok" || echo "broken"
```

External dependencies:

```bash
test -d ~/.oh-my-zsh && echo "OMZ ok" || echo "OMZ missing"
```

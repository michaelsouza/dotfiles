# Dotfiles

Personal development environment configuration for command-line software work.

This repository is organized by tool. Each tool owns its own configuration,
documentation and setup assumptions, while the repository root provides the
small shared interface: clone the repo, run the bootstrap script and then work
inside each tool-specific module when changing behavior.

## Tools

- `nvim`: Neovim IDE configuration with LSP, formatting, debugging, Git tools,
  project navigation and plugin management through `lazy.nvim`.
- `tmux`: Terminal multiplexer configuration for local and remote development
  sessions.
- `zsh`: Zsh shell configuration with Oh-My-Zsh, Powerlevel10k, and external
  plugins (autosuggestions, syntax highlighting).
- `bin/system-monitor`: live terminal dashboard for CPU, RAM, GPU, disk,
  network traffic, hardware models and the top resource-consuming processes.
  It uses only the Python standard library and Linux system interfaces.

## Directory Layout

Expected layout:

```text
~/gitrepos/dotfiles
├── README.md
├── bin/
│   └── bootstrap
├── nvim/
│   ├── README.md
│   └── .config/
│       └── nvim/
│           ├── init.lua
│           ├── lazy-lock.json
│           └── lua/
├── tmux/
│   ├── README.md
│   └── .config/
│       └── tmux/
│           └── tmux.conf
└── zsh/
    ├── README.md
    ├── .zshrc
    ├── .zshenv
    └── .p10k.zsh
```

The active configuration should point into this repository:

```text
~/.config/nvim -> ~/gitrepos/dotfiles/nvim/.config/nvim
~/.config/tmux -> ~/gitrepos/dotfiles/tmux/.config/tmux
~/.tmux.conf -> ~/.config/tmux/tmux.conf
~/.zshrc -> ~/gitrepos/dotfiles/zsh/.zshrc
~/.zshenv -> ~/gitrepos/dotfiles/zsh/.zshenv
~/.p10k.zsh -> ~/gitrepos/dotfiles/zsh/.p10k.zsh
```

## Bootstrap on a New Machine

Clone the repository:

```bash
mkdir -p ~/gitrepos
cd ~/gitrepos
git clone <REPOSITORY_URL> dotfiles
cd dotfiles
```

Create or refresh configuration links:

```bash
bin/bootstrap
```

## System Monitor

Run the live resource dashboard directly from the repository:

```bash
bin/system-monitor
```

Use `Ctrl+C` to close it. A different disk and refresh interval can be chosen:

```bash
bin/system-monitor --disk /home --interval 1
```

For scripts, logs or a single snapshot, use
`bin/system-monitor --once --no-color`. Network rates combine all non-loopback
interfaces and include separate recent-history graphs for download and upload.
GPU process usage is shown when the NVIDIA driver exposes it via
`nvidia-smi`; AMD GPU utilization is detected through Linux `sysfs` when
available. Hardware names are read from Linux and `lspci` when installed.

The bootstrap script refuses to overwrite real files or directories at the
target paths. Move existing configs aside before running it if needed.

## Installation Notes

Check whether tmux is installed:

```bash
tmux -V
```

On Debian or Ubuntu machines where tmux is missing:

```bash
sudo apt update
sudo apt install tmux
```

Neovim can be installed system-wide or locally under `nvim/.tools/`; see
`nvim/README.md` for the local no-`sudo` flow.

## Documentation

- `nvim/README.md`: Neovim setup, Mason packages, Treesitter parsers,
  keybindings, terminal notes and health checks.
- `tmux/README.md`: tmux installation, symlinks, prefix, keybindings and health
  checks.
- `zsh/README.md`: zsh installation, symlinks, plugins, aliases and health
  checks.

## Git Workflow

After each stable change:

```bash
git status
git add .
git commit -m "Describe the change"
git status
```

Do not commit generated plugin directories or local tools.

Ignored:

```text
.tools/
```

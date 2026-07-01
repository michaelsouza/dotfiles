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
└── tmux/
    ├── README.md
    └── .config/
        └── tmux/
            └── tmux.conf
```

The active configuration should point into this repository:

```text
~/.config/nvim -> ~/gitrepos/dotfiles/nvim/.config/nvim
~/.config/tmux -> ~/gitrepos/dotfiles/tmux/.config/tmux
~/.tmux.conf -> ~/.config/tmux/tmux.conf
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

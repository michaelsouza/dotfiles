# Neovim IDE Configuration

Personal Neovim configuration focused on software development, scientific
programming, Python, C/C++, Git workflows, LSP, formatting, debugging and
project navigation.

This setup is designed to work without `sudo` on remote machines. Neovim
itself can be stored inside this module under `.tools/`, while plugins, LSP
servers and formatters are installed under the user's home directory.

## Overview

Main features:

- Plugin management with `lazy.nvim`
- Theme with `kanagawa`
- File explorer with `neo-tree`
- Fuzzy finder with `telescope.nvim`
- Statusline with `lualine`
- Buffer tabs with `bufferline.nvim`
- Syntax highlighting with `nvim-treesitter`
- LSP support with Mason and native Neovim LSP
- Autocomplete with `nvim-cmp`
- Formatting with `conform.nvim`
- Git integration with `gitsigns`, `diffview.nvim` and `vim-fugitive`
- Diagnostics panel with `trouble.nvim`
- Integrated terminal with `toggleterm.nvim`
- Debugging with `nvim-dap`, `nvim-dap-ui`, `debugpy` and `codelldb`
- Session persistence with `persistence.nvim`
- Project management with `project.nvim`
- Commenting, autopairs, surround editing, indentation guides and TODO
  highlighting

## Directory layout

Expected module layout:

```text
~/gitrepos/dotfiles/nvim
├── README.md
├── .config/
│   └── nvim/
│       ├── init.lua
│       ├── lazy-lock.json
│       └── lua/
│           ├── config/
│           └── plugins/
└── .tools/
    └── nvim-linux-x86_64/
```

The `.tools/` directory is intentionally ignored by Git.

The active Neovim config should point to this module config directory:

```bash
~/.config/nvim -> ~/gitrepos/dotfiles/nvim/.config/nvim
```

Create or update the symlink:

```bash
mkdir -p ~/.config
ln -sfn ~/gitrepos/dotfiles/nvim/.config/nvim ~/.config/nvim
```

Check with:

```bash
test -L ~/.config/nvim
ls -ld ~/.config/nvim
readlink -f ~/.config/nvim
```

## Local Neovim install

Install Neovim locally if needed:

```bash
cd ~/gitrepos/dotfiles/nvim

mkdir -p .tools ~/.local/bin
cd /tmp

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz

rm -rf ~/gitrepos/dotfiles/nvim/.tools/nvim-linux-x86_64
tar -C ~/gitrepos/dotfiles/nvim/.tools -xzf /tmp/nvim-linux-x86_64.tar.gz

ln -sf ~/gitrepos/dotfiles/nvim/.tools/nvim-linux-x86_64/bin/nvim ~/.local/bin/nvim
```

Make sure `~/.local/bin` is in `PATH`:

```bash
export PATH="$HOME/.local/bin:$PATH"
```

Check:

```bash
which nvim
nvim --version | head -n 1
```

## External command-line tools

Recommended tools:

```text
git
curl
tar
unzip
rg
fd
node
npm
python3
tree-sitter
cc/gcc/clang
```

In this setup, `rg` and `fd` may also be installed locally under:

```text
~/gitrepos/dotfiles/nvim/.tools/bin
```

and linked into:

```text
~/.local/bin
```

## Mason packages

Install LSP servers, formatters and debuggers with:

```vim
:MasonInstall lua-language-server pyright ruff clangd
:MasonInstall stylua ruff black clang-format prettier
:MasonInstall debugpy codelldb
```

Installed Mason binaries are stored in:

```text
~/.local/share/nvim/mason/bin
```

## Treesitter parsers

Install parsers with:

```bash
nvim --headless "+lua require('nvim-treesitter').install({ 'bash', 'c', 'cpp', 'json', 'lua', 'markdown', 'markdown_inline', 'python', 'toml', 'vim', 'vimdoc', 'yaml' }):wait(300000)" +qa
```

## Important keybindings

The leader key is:

```text
Space
```

### General

```text
Space w      save file
Space q      quit
Space h      clear search highlight
```

### Windows and splits

```text
Ctrl+h       move to left split
Ctrl+j       move to lower split
Ctrl+k       move to upper split
Ctrl+l       move to right split
```

### Files and search

```text
Space f f    find files
Space f g    live grep
Space f b    find buffers
Space f h    help tags
Space f t    find TODO comments
Space e      toggle file explorer
```

### Buffers

```text
Shift+h      previous buffer
Shift+l      next buffer
Space b d    delete buffer
Space b p    pick buffer
```

### LSP

```text
gd           go to definition
gD           go to declaration
gr           references
K            hover
Space r n    rename
Space c a    code action
Space d f    diagnostic float
[d           previous diagnostic
]d           next diagnostic
```

### Formatting

```text
Space f m    format current file
```

Files are also formatted on save when a formatter is configured.

### Completion

```text
Ctrl+Space   open completion menu
Ctrl+e       abort completion
Enter        confirm selected completion item
Tab          next completion item or expand/jump snippet
Shift+Tab    previous completion item or jump back in snippet
```

### Diagnostics and Trouble

```text
Space x x    workspace diagnostics
Space x X    buffer diagnostics
Space x s    symbols
Space x q    quickfix list
Space x l    location list
Space x t    TODO comments in Trouble
```

### Git

```text
Space g s    Git status
Space g b    Git blame
Space g l    Git log
Space g d    Diffview open
Space g h    file history
Space g H    repository history
Space g q    close Diffview
```

Gitsigns:

```text
]c           next hunk
[c           previous hunk
Space h p    preview hunk
Space h r    reset hunk
Space h b    blame line
```

### Terminal

```text
Ctrl+\       toggle floating terminal
Space t h    horizontal terminal
Space t v    vertical terminal
Space t f    floating terminal
```

To leave terminal mode:

```text
Ctrl+\ Ctrl+n
```

### Debugging

```text
Space d b    toggle breakpoint
Space d c    continue/start debug
Space d i    step into
Space d o    step over
Space d O    step out
Space d r    open debug REPL
Space d t    terminate debug session
Space d u    toggle debug UI
```

Python uses `debugpy`.

C/C++ uses `codelldb`.

### Project and sessions

```text
Space p p    project menu
Space p r    register project root
Space p s    switch project
Space p R    recent projects
Space p S    project sessions

Space q s    restore session
Space q S    select session
Space q l    restore last session
Space q d    do not save session
```

### Editing helpers

```text
gcc          comment/uncomment current line
gc           comment visual selection

sa           add surrounding
sd           delete surrounding
sr           replace surrounding
sf           find surrounding
sF           find surrounding to the left
sh           highlight surrounding
sn           update surrounding search lines

saiw"        surround word with double quotes
saiw)        surround word with parentheses
sd"          delete surrounding double quotes
sr"'         replace double quotes with single quotes
```

## Font and terminal notes

For icons to render correctly, the local terminal must use a Nerd Font.

Working local setup:

```text
Terminal: kitty
Font: JetBrainsMono Nerd Font Mono
Display backend: x11
```

Kitty config example:

```text
font_family JetBrainsMono Nerd Font Mono
bold_font auto
italic_font auto
bold_italic_font auto
font_size 12.0
linux_display_server x11
```

When using SSH, the font must be configured on the local machine, not on the
remote server.

## Health checks

These checks assume `~/.config/nvim` points to this module and `nvim` is
available in `PATH`.

Useful commands:

```vim
:checkhealth
:Lazy
:Mason
:ConformInfo
:Project
:Trouble diagnostics toggle
```

Headless checks:

```bash
nvim --headless "+Lazy! sync" +qa

nvim --headless \
  "+lua local ok = pcall(require, 'cmp'); print(ok and 'cmp=ok' or 'cmp=error')" \
  +qa

nvim --headless /tmp/test_lsp.py \
  "+sleep 3" \
  "+lua local clients = vim.lsp.get_clients({ bufnr = 0 }); for _, c in ipairs(clients) do print('client=' .. c.name) end; if #clients == 0 then print('no clients') end" \
  +qa
```

# ~/.zshenv — sourced for ALL zsh processes (login, interactive, script)
# Managed by dotfiles repo; do not edit manually.

# -- PATH: ensure ~/.local/bin is available
if [[ -d "$HOME/.local/bin" && "$PATH" != *"$HOME/.local/bin"* ]]; then
  export PATH="$HOME/.local/bin:$PATH"
fi

# -- Editor
export EDITOR=nvim
export VISUAL=nvim

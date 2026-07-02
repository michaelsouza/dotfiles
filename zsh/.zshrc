# ~/.zshrc — Zsh interactive shell config
# Managed by dotfiles repo; do not edit manually.
# Sourced only for interactive shells.

# -- Terminal
export TERM="${TERM:-xterm-256color}"

# -- General options
setopt AUTO_CD          # cd into a directory just by typing its name
setopt AUTO_PUSHD       # change dirs, push old onto stack
setopt PUSHD_IGNORE_DUP # don't push duplicate dirs onto stack
setopt INC_APPEND_HISTORY # append history as you go, not on shell exit

# -- Prompt (basic, overwritten by p10k later)
PROMPT='%n@%m %~ %# '

# -- Zsh custom plugins directory
if [[ -d "$HOME/.oh-my-zsh/custom/plugins" ]]; then
  export ZSH_CUSTOM_PLUGINS="$HOME/.oh-my-zsh/custom/plugins"
fi

# -- Aliases
alias ll='ls -la'
alias la='ls -A'
alias l='ls -l'
alias ..='cd ..'
alias ...='cd ../..'
alias vim='nvim'
alias grep='grep --color=auto'

if command -v bat >/dev/null 2>&1; then
  alias cat='bat --style=plain'
fi

# -- Oh-My-Zsh (loaded only if installed)
if [[ -f "$HOME/.oh-my-zsh/oh-my-zsh.sh" ]]; then
  export ZSH="$HOME/.oh-my-zsh"
  ZSH_THEME="powerlevel10k/powerlevel10k"
  plugins=(git z extract sudo)
  source "$ZSH/oh-my-zsh.sh"
fi

# -- Powerlevel10k (loaded only if config exists)
if [[ -f "$HOME/.p10k.zsh" ]]; then
  source "$HOME/.p10k.zsh"
fi

# -- External plugins (loaded only if present)
if [[ -n "${ZSH_CUSTOM_PLUGINS:-}" && -f "$ZSH_CUSTOM_PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
  source "$ZSH_CUSTOM_PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

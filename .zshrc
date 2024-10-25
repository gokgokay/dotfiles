# Check if the instant prompt script exists and source it
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Aliases
alias vim="nvim"
alias cc="clear"
alias zshreload="source ~/.zshrc"
alias zshconfig="nvim ~/.zshrc"
alias tmuxconfig="nvim ~/.tmux.conf"
alias weztermconfig="nvim ~/.wezterm.lua"
alias vv="cd dotfiles/.config/nvim/ && nvim"
alias vd="cd dotfiles/.config/nvim/"
alias oo="cd ~/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/Notes/ && nvim"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Key bindings 
bindkey '^u' backward-kill-line
bindkey '^r' history-incremental-search-backward
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey '^k' kill-line
bindkey '^l' clear-screen
bindkey -v

# Export variables 
export ZSH="$HOME/.oh-my-zsh"
export EDITOR='nvim'

# Set theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Update automatically without asking
zstyle ':omz:update' mode auto 

# Plugins to load
plugins=(
  git 
  zsh-autosuggestions 
  zsh-syntax-highlighting 
  web-search
  python 
  httpie
)

# Source the Oh My Zsh framework
source $ZSH/oh-my-zsh.sh

# History setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history 
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# Completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# Eza (better ls) with icons
alias ls="eza --icons=always"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval $(thefuck --alias)

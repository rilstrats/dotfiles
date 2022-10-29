# tmux
if [[ -z "$TMUX" && "$TERM" != "xterm-256color" ]]; then
  tmux attach-session -t home || tmux new-session -s home -c $HOME 
fi

# xdg
[[ -f "$HOME/.config/zsh/custom/xdg.zsh" ]] && \
  source "$HOME/.config/zsh/custom/xdg.zsh"

# p10k instant prompt (things with output above, no output below)
[[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]] && \
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"

# zsh
# setopt autocd beep extendedglob nomatch notify
bindkey -v # vim
export ZSH="$XDG_CONFIG_HOME/zsh"
export ZSH_T="$ZSH/theme"
export ZSH_P="$ZSH/plugin"
export ZSH_C="$ZSH/custom"

# themes and plugins
[[ -f "$ZSH_T/powerlevel10k/powerlevel10k.zsh-theme" ]] && \
  source "$ZSH_T/powerlevel10k/powerlevel10k.zsh-theme"

[[ -f "$ZSH_P/zsh-vi-mode/zsh-vi-mode.plugin.zsh" ]] && \
  source "$ZSH_P/zsh-vi-mode/zsh-vi-mode.plugin.zsh"

[[ -f "$ZSH_P/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] && \
  source "$ZSH_P/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

[[ -f "$ZSH_P/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] && \
  source "$ZSH_P/zsh-autosuggestions/zsh-autosuggestions.zsh"

# history
HISTFILE="$ZSH/histfile"
HISTSIZE=1000
SAVEHIST=1000

# autocomplete
# zstyle ':completion:*' completer _complete _ignored _approximate
zstyle :compinstall filename "$HOME/.zshrc"
autoload -Uz compinit
compinit

# file shortcuts (and go variables)
[[ -f "$ZSH_C/files.zsh" ]] && source "$ZSH_C/files.zsh"

# secret (for sensitive configuration files)
[[ -f "$ZSH_C/secret.zsh" ]] && source "$ZSH_C/secret.zsh"

# path
export PATH="$HOME/.local/bin:$GOBIN:$PATH"

# editor
[[ -f "$ZSH_C/editor.zsh" ]] && source "$ZSH_C/editor.zsh"

# colab
[[ -f "$ZSH_C/colab.zsh" ]] && source "$ZSH_C/colab.zsh"

# legacy dotfile management
[[ -f "$ZSH_C/dotfiles.zsh" ]] && source "$ZSH_C/dotfiles.zsh"

# git (includes new dotfile management)
[[ -f "$ZSH_C/git.zsh" ]] && source "$ZSH_C/git.zsh"

# aliases
[[ -f "$ZSH_C/aliases.zsh" ]] && source "$ZSH_C/aliases.zsh"

# nvm (lazy loaded)
[[ -f "$ZSH_C/nvm.zsh" ]] && source "$ZSH_C/nvm.zsh"

# conda (lazy loaded)
# [[ -f "$ZSH_C/conda.zsh" ]] && source "$ZSH_C/conda.zsh"
[[ -f "$ZSH_C/miniconda.zsh" ]] && source "$ZSH_C/miniconda.zsh"

# p10k config
[[ -f "$HOME/.p10k.zsh" ]] && source "$HOME/.p10k.zsh"


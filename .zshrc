# tmux
if [[ -z "$TMUX" && "$TERM" != "xterm-256color" ]]; then
  tmux attach-session -t home || tmux new-session -s home -c $HOME 
fi

# xdg
[[ -f "$HOME/.config/zsh/xdg.zsh" ]] && \
  source "$HOME/.config/zsh/xdg.zsh"

# p10k instant prompt (things with output above, no output below)
[[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]] && \
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"

# zsh
# setopt autocd beep extendedglob nomatch notify
bindkey -v # vim
export ZSH="$XDG_CONFIG_HOME/zsh"

# themes and plugins
[[ -f "$ZSH/powerlevel10k/powerlevel10k.zsh-theme" ]] && \
  source "$ZSH/powerlevel10k/powerlevel10k.zsh-theme"

[[ -f "$ZSH/zsh-vi-mode/zsh-vi-mode.plugin.zsh" ]] && \
  source "$ZSH/zsh-vi-mode/zsh-vi-mode.plugin.zsh"

[[ -f "$ZSH/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] && \
  source "$ZSH/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

[[ -f "$ZSH/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] && \
  source "$ZSH/zsh-autosuggestions/zsh-autosuggestions.zsh"

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
[[ -f "$ZSH/files.zsh" ]] && source "$ZSH/files.zsh"

# path
export PATH="$HOME/.local/bin:$GOBIN:$PATH"

# editor
[[ -f "$ZSH/editor.zsh" ]] && source "$ZSH/editor.zsh"

# legacy dotfile management
[[ -f "$ZSH/dotfiles.zsh" ]] && source "$ZSH/dotfiles.zsh"

# git (includes new dotfile management)
[[ -f "$ZSH/git.zsh" ]] && source "$ZSH/git.zsh"

# aliases
[[ -f "$ZSH/aliases.zsh" ]] && source "$ZSH/aliases.zsh"

# nvm (lazy loaded)
[[ -f "$ZSH/nvm.zsh" ]] && source "$ZSH/nvm.zsh"

# conda (lazy loaded)
[[ -f "$ZSH/conda.zsh" ]] && source "$ZSH/conda.zsh"

# colab
[[ -f "$ZSH/colab.zsh" ]] && source "$ZSH/colab.zsh"

# p10k config
[[ -f "$HOME/.p10k.zsh" ]] && source "$HOME/.p10k.zsh"


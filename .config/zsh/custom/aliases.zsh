#!/bin/zsh

#ls
alias ls='ls --color=auto'
alias l='ls -ohA --color=auto'

alias la='ls -A --color=auto'
alias ll='ls -oh --color=auto'

alias l.='ls -d .* --color=auto'
alias ll.='ls -ohd .* --color=auto'

# games
alias minecraft="$HOME/.minecraft/launcher/minecraft-launcher & &> /dev/null"

# docker
alias hollywood='docker run --rm -it bcbcarl/hollywood'
alias kali='docker run --rm -it kalilinux/kali-rolling'

# owd
alias owd='cd $OLDPWD'

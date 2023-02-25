HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=100000
setopt autocd beep extendedglob
bindkey -e
zstyle :compinstall filename '/home/kadyklesha/.zshrc'
zstyle ':completion:*' menu select
zstyle ':completion:*:manuals'    separate-sections true
zstyle ':completion:*:manuals.*'  insert-sections   true
zstyle ':completion:*:man:*'      menu yes select

autoload -Uz compinit
compinit

zmodload zsh/complist
bindkey -M menuselect '^[[Z' reverse-menu-complete

source ${ZDOTDIR:-~}/.antidote/antidote.zsh
antidote load

autoload -U select-word-style
select-word-style bash

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=7'

export TERM=xterm
export PATH=$PATH:$HOME/.local/bin

export EDITOR=nvim

alias cdt="cd ~/temp"
alias v="nvim"
alias sv="sudo nvim"
alias bspwmrc="$EDITOR ~/.config/bspwm/bspwmrc"
alias swaycfg="$EDITOR ~/.config/sway/config"
alias ip="ip -c=auto"
alias cat="bat --color always --plain"
alias :q=exit
alias df="duf"
alias free="grc --colour=auto free"
alias ping="grc --colour=auto ping"
alias du="dust -r"
alias dig="grc --colour=auto dig"
alias ls="exa -lah"
alias icat="viu"
alias tree="broot"
alias dots='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias sc='systemctl'
alias sudo='sudo '

bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3~" delete-char
bindkey "^H" backward-kill-word
bindkey "^[[3;5~" kill-word
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

function precmd () {
  echo -ne "\033]0;$(pwd | sed -e "s;^$HOME;~;")\a"
}

eval "$(starship init zsh)"
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

source /home/vobbla16/.config/broot/launcher/bash/br

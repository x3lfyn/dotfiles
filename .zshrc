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

source ${ZDOTDIR:-~}/.antidote/antidote.zsh
antidote load

autoload -U select-word-style
select-word-style bash

export EDITOR=nvim

alias cdt="cd ~/temp"
alias v="nvim"
alias bspwmrc="$EDITOR ~/.config/bspwm/bspwmrc"
alias swaycfg="$EDITOR ~/.config/sway/config"
alias ip="ip -c=auto"
alias config="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias cat="bat --color always --plain"
alias homeserver="ssh -l confuser server.home.local"
alias :q=exit
alias df="grc --colour=auto df"
alias free="grc --colour=auto free"
alias ping="grc --colour=auto ping"
alias du="grc --colour=auto du"
alias dig="grc --colour=auto dig"
alias s="systemctl"
alias ss="sudo systemctl"
alias ls="exa -lah"
alias cd="z"

bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3~" delete-char
bindkey "^H" backward-kill-word
bindkey "^[[3;5~" kill-word
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

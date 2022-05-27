if status is-interactive
    # Commands to run in interactive sessions can go here

end

theme_gruvbox dark hard

export EDITOR=nvim

alias ls="exa -lagh"
alias fishconfig="$EDITOR ~/.config/fish/config.fish"
alias bspwmrc="$EDITOR ~/.config/bspwm/bspwmrc"
alias sxhkdrc="$EDITOR ~/.config/sxhkd/sxhkdrc"
alias polybarcfg="$EDITOR ~/.config/polybar/config.ini"
alias nvimcfg="$EDITOR ~/.config/nvim/init.vim"
alias cdt="cd ~/Documents/temp/"
alias homeserver="ssh -l confuser server.home.local"
alias :q="exit"
alias cat="bat --color always --plain"
alias ip="ip -c=auto"
alias ssh="kitty +kitten ssh"
alias v="nvim"
alias f="ranger"

# dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

export PATH="$PATH:~/.cargo/bin"

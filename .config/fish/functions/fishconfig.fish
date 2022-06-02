function fishconfig --wraps='nvim ~/.config/fish/config.fish' --description 'alias fishconfig=nvim ~/.config/fish/config.fish'
  nvim ~/.config/fish/config.fish $argv; 
end

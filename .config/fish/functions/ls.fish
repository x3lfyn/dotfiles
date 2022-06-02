function ls --wraps='exa -lagh' --description 'alias ls=exa -lagh'
  exa -lagh $argv; 
end

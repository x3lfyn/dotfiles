function homeserver --wraps='ssh -l confuser server.home.local' --description 'alias homeserver=ssh -l confuser server.home.local'
  ssh -l confuser server.home.local $argv; 
end

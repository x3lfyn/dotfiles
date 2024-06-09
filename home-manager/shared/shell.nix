{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  programs.eza.enable = true;
  programs.bat.enable = true;

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zsh = {
    enable = true;
    autocd = true;
    shellAliases = {
      v = "nvim";
      ls = "exa -lah";
      cat = "bat --color always --plain";
      c = "cat";
      g = "git";
      d = "docker";
      free = "grc --colour=auto free -h";
      ip = "ip -c=auto";
      ping = "grc --colour=auto ping";
      df = "duf";
      du = "dust";
      dig = "dog --time";
      s = "sudo ";
      ipy = "ipython";
      open = "re.sonny.Junction";
      ":q" = "exit";
    };
    history = {
      size = 20000;
      path = "${config.xdg.dataHome}/zsh/history";
      ignoreDups = true;
      expireDuplicatesFirst = true;
    };
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = false; # use fast-syntax-highlighting
    initExtra = ''
      # show completion menus
      #zstyle ':completion:*' menu select
      #zstyle ':completion:*:manuals'    separate-sections true
      #zstyle ':completion:*:manuals.*'  insert-sections   true
      #zstyle ':completion:*:man:*'      menu yes select

      # walk back on completion menu
      zmodload zsh/complist
      bindkey -M menuselect '^[[Z' reverse-menu-complete

      preexec() { print -Pn "\e]0;%~\a" }

      # delete words on ctrl-del, ctrl-del, etc
      bindkey "^[[H" beginning-of-line
      bindkey "^[[F" end-of-line
      bindkey "^[[3~" delete-char
      bindkey "^H" backward-kill-word
      bindkey "^[[3;5~" kill-word
      bindkey "^[[1;5C" forward-word
      bindkey "^[[1;5D" backward-word

      # correct work of alt-delete # use env WORDCHARS
      # autoload -U select-word-style
      # select-word-style bash

      # customize zsh-syntax-highlighting
      #ZSH_HIGHLIGHT_HIGHLIGHTERS+=(brackets pattern cursor)
    '';
    sessionVariables = {
      ZSH_AUTOSUGGEST_USE_ASYNC = "true";
      WORDCHARS = "";
    };
    completionInit = ''
      autoload -Uz compinit
      zstyle ':completion:*' menu select
      zstyle ':completion:*' menu yes select
      zstyle ':completion:*' sort false
      zstyle ':completion:*' completer _complete _match _approximate
      zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'
      zstyle ':completion:*' special-dirs true
      zstyle ':completion:*' rehash true
      zstyle ':completion:*' list-grouped false
      zstyle ':completion:*' list-separator '''
      zstyle ':completion:*' group-name '''
      zstyle ':completion:*' verbose yes
      zstyle ':completion:*' file-sort modification
      zstyle ':completion:*' list-colors ''${(s.:.)LS_COLORS}
      zstyle ':completion:*:matches' group 'yes'
      zstyle ':completion:*:warnings' format '%F{red}%B-- No match for: %d --%b%f'
      zstyle ':completion:*:messages' format '%d'
      zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
      zstyle ':completion:*:descriptions' format '[%d]'
      zstyle ':completion:*:match:*' original only
      zstyle ':completion:*:approximate:*' max-errors 1 numeric
      zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'
      zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters
      zstyle ':completion:*:jobs' numbers true
      zstyle ':completion:*:jobs' verbose true
      zstyle ':completion:*:git-checkout:*' sort false
      zstyle ':completion:*:exa' sort false
      zstyle ':completion:complete:*:options' sort false
      zstyle ':completion:files' sort false
      zmodload zsh/zle
      zmodload zsh/zpty
      zmodload zsh/complist
    '';
    plugins = [
      {
        name = "fast-syntax-highlighting";
        src = pkgs.fetchFromGitHub {
          owner = "zdharma-continuum";
          repo = "fast-syntax-highlighting";
          rev = "cf318e06a9b7c9f2219d78f41b46fa6e06011fd9";
          sha256 = "sha256-RVX9ZSzjBW3LpFs2W86lKI6vtcvDWP6EPxzeTcRZua4=";
        };
      }
      {
        name = "colored-man-pages_mod";
        src = pkgs.fetchFromGitHub {
          owner = "zuxfoucault";
          repo = "colored-man-pages_mod";
          rev = "6a01b132b2c34e8da7a410c45f44d213444de869";
          sha256 = "WJ+ohX1yOVI+tw3Q1ns86y2dyljgBXLRZvdd+8A87t0=";
        };
      }
      {
        name = "zsh-fzf-history-search";
        src = pkgs.fetchFromGitHub {
          owner = "joshskidmore";
          repo = "zsh-fzf-history-search";
          rev = "d1aae98ccd6ce153c97a5401d79fd36418cd2958";
          sha256 = "4Dp2ehZLO83NhdBOKV0BhYFIvieaZPqiZZZtxsXWRaQ=";
        };
      }
      {
        name = "cd-dot-expansion";
        src = pkgs.fetchFromGitHub {
          owner = "wazum";
          repo = "zsh-directory-dot-expansion";
          rev = "fda62b133a197288c61672eb6c98379ca8513c13";
          sha256 = "Hs4n43ceJoTKrh6Z4b/ozZ0McL0IXgdufljRtP++dVs=";
        };
      }
      {
        name = "zsh-autopair";
        src = pkgs.fetchFromGitHub {
          owner = "hlissner";
          repo = "zsh-autopair";
          rev = "396c38a7468458ba29011f2ad4112e4fd35f78e6";
          sha256 = "PXHxPxFeoYXYMOC29YQKDdMnqTO0toyA7eJTSCV6PGE=";
        };
      }
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "v0.7.0";
          sha256 = "oQpYKBt0gmOSBgay2HgbXiDoZo5FoUKwyHSlUrOAP5E=";
        };
      }
    ];

    envExtra = ''
      export SUDO_PROMPT=$'Password for ->\033[32;05;16m %u\033[0m  '
    '';
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      format = "$username$hostname $all$directory$character";
      add_newline = true;
      line_break.disabled = false;
      directory = {
        style = "cyan";
      };
      username = {
        style_user = "#e6b450 bold";
        style_root = "bold red";
        format = "[$user]($style)";
        show_always = true;
      };
      hostname = {
        ssh_only = false;
        format = "[@$hostname]($style)";
        style = "#e6b450 bold";
      };
      character = {
        success_symbol = "[λ>](green)";
        error_symbol = "[λ>](red)";
      };
    };
  };
}

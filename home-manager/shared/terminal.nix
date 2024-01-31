{ inputs, outputs, lib, config, pkgs, ... }: {
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal = {
          family = "JetBrainsMono Nerd Font Propo";
          style = "Regular";
        };
#        bold = {
#          family = "JetBrainsMono Nerd Font Propo";
#          style = "Bold";
#        };
#        italic = {
#          family = "JetBrainsMono Nerd Font Propo";
#          style = "Italic";
#        };
#        bold_italic = {
#          family = "JetBrainsMono Nerd Font Propo";
#          style = "Bold Italic";
#        };
        size = 13;
      };
      env = { TERM = "xterm-256color"; };
      window = {
        padding = {
          x = 10;
          y = 10;
        };
        opacity = 0.7;
      };
      dynamic_title = true;
      scrolling = { history = 100000; };
      cursor = { style = "Beam"; };
      colors = {
        bright = {
          black = "0x665c54";
          red = "0xfb4934";
          green = "0xb8bb26";
          yellow = "0xfabd2f";
          blue = "0x83a598";
          magenta = "0xd3869b";
          cyan = "0x8ec07c";
          white = "0xf9f5d7";
        };
        normal = {
          black = "0x7c6f64";
          red = "0xcc241d";
          green = "0x98971a";
          yellow = "0xd79921";
          blue = "0x458588";
          magenta = "0xb16286";
          cyan = "0x689d6a";
          white = "0xfbf1c7";
        };
        primary = {
          background = "0x0A0E14";
          foreground = "0xB3B1AD";
        };
      };
    };
  };



  programs.foot = {
    enable = true;
    server.enable = true;
    settings = {
      main = {
        font = "JetBrainsMono Nerd Font Propo:size=13";
        pad = "10x10 center";
        term = "xterm-256color";
        resize-delay-ms = 0;
      };
      scrollback = {
        multiplier = 13.0;
      };
      cursor = {
        style = "beam";
        blink = true;
      };
      colors = {
        alpha = 0.7;

        foreground = "B3B1AD";
        background = "0A0E14";

        selection-foreground = "f2e5bc";
        selection-background = "32302f";

        regular0 = "7c6f64";
        regular1 = "cc241d";
        regular2 = "98971a";
        regular3 = "d79921";
        regular4 = "458588";
        regular5 = "b16286";
        regular6 = "689d6a";
        regular7 = "fbf1c7";

        bright0 = "665c54";
        bright1 = "fb4934";
        bright2 = "b8bb26";
        bright3 = "fabd2f";
        bright4 = "83a598";
        bright5 = "d3869b";
        bright6 = "8ec07c";
        bright7 = "f9f5d7";

#        "16" = "ffa066";
#        "17" = "ff5d62";
      };
    };
  };
}



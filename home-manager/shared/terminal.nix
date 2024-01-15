{ inputs, outputs, lib, config, pkgs, ... }: {
  programs.alacritty = {
    enable = false;
    settings = {
      font = {
        normal = {
          family = "JetBrainsMono NF";
          style = "Regular";
        };
        bold = {
          family = "JetBrainsMono NF";
          style = "Bold";
        };
        italic = {
          family = "JetBrainsMono NF";
          style = "Italic";
        };
        bold_italic = {
          family = "JetBrainsMono NF";
          style = "Bold Italic";
        };
        size = 11;
      };
      env = { TERM = "xterm-256color"; };
      window = {
        padding = {
          x = 8;
          y = 8;
        };
        opacity = 0.9;
      };
      dynamic_title = true;
      scrolling = { history = 20000; };
      cursor = { style = "Block"; };
      colors = {
        bright = {
          black = "0x727169";
          blue = "0x7fb4ca";
          cyan = "0x7aa89f";
          green = "0x98bb6c";
          magenta = "0x938aa9";
          red = "0xe82424";
          white = "0xdcd7ba";
          yellow = "0xe6c384";
        };
        indexed_colors = [
          {
            color = "0xffa066";
            index = 16;
          }
          {
            color = "0xff5d62";
            index = 17;
          }
        ];
        normal = {
          black = "0x090618";
          blue = "0x7e9cd8";
          cyan = "0x6a9589";
          green = "0x76946a";
          magenta = "0x957fb8";
          red = "0xc34043";
          white = "0xc8c093";
          yellow = "0xc0a36e";
        };
        primary = {
          background = "0x1f1f28";
          foreground = "0xdcd7ba";
        };
        #    selection = {
        #      background = "0x2d4f67";
        #      foreground = "0xc8c093";
        #    };
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



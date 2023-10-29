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
        alpha = 0.93;

        foreground = "dcd7ba";
        background = "1f1f28";

        selection-foreground = "c8c093";
        selection-background = "2d4f67";

        regular0 = "090618";
        regular1 = "c34043";
        regular2 = "76946a";
        regular3 = "c0a36e";
        regular4 = "7e9cd8";
        regular5 = "957fb8";
        regular6 = "6a9589";
        regular7 = "c8c093";

        bright0 = "727169";
        bright1 = "e82424";
        bright2 = "98bb6c";
        bright3 = "e6c384";
        bright4 = "7fb4ca";
        bright5 = "938aa9";
        bright6 = "7aa89f";
        bright7 = "dcd7ba";

        "16" = "ffa066";
        "17" = "ff5d62";
      };
    };
  };
}



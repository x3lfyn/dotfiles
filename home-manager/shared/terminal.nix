{ inputs, outputs, lib, config, pkgs, ... }: {
  programs.kitty = {
    enable = false;
    theme = "Ayu";
    font = {
      package = (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; });
      name = "FantasqueSansM Nerd Font";
      size = 14;
    };
    shellIntegration.enableZshIntegration = true;
    settings = {
      cursor_blink_interval = "0.9";
      cursor_stop_blinking_after = 0;
      scrollback_lines = 20000;
      enable_audio_bell = true;
      visual_bell_duration = "0";
      window_alert_on_bell = true;
      window_padding_width = 6;
      background_opacity = "0.85";
    };
  };

  programs.alacritty = {
    enable = false;
    settings = {
      font = {
        normal = {
          family = "FantasqueSansM Nerd Font";
          style = "Regular";
        };
        size = 14;
      };
      env = { TERM = "xterm-256color"; };
      window = {
        padding = {
          x = 10;
          y = 10;
        };
        opacity = 0.85;
      };
      dynamic_title = true;
      scrolling = { history = 100000; };
      cursor = {
        style = {
          shape = "Beam";
          blinking = "Always";
        };
      };
      scrolling = {
        multiplier = 7;
      };
      colors = {
        bright = {
          black = "0x737d87";
          blue = "0x59c2ff";
          cyan = "0x5ccfe6";
          green = "0xc2d94c";
          magenta = "0xb77ee0";
          red = "0xff3333";
          white = "0xffffff";
          yellow = "0xe7c547";
        };
        normal = {
          black = "0x000000";
          blue = "0x73d0ff";
          cyan = "0x83CEC6";
          green = "0xbae67e";
          magenta = "0xd4bfff";
          red = "0xf34a4a";
          white = "0xf2f2f2";
          yellow = "0xffee99";
        };
        primary = {
          background = "0x0f1419";
          foreground = "0xe6e1cf";
        };
      };
    };
  };

  programs.foot = {
    enable = true;
    server.enable = true;
    settings = {
      main = {
        font = "FantasqueSansM Nerd Font:size=14";
        pad = "10x10 center";
        term = "xterm-256color";
        resize-delay-ms = 0;
      };
      scrollback = {
        lines = 40000;
      };
      bell = {
        urgent = true;
        visual = false;
      };
      cursor = {
        style = "beam";
        blink = true;
      };
      colors = {
        alpha = 0.85;

        foreground = "e6e1cf";
        background = "0f1419";

        #        selection-foreground = "f2e5bc";
        #        selection-background = "32302f";

        regular0 = "0x000000";
        regular1 = "0xf34a4a";
        regular2 = "0xbae67e";
        regular3 = "0xffee99";
        regular4 = "0x73d0ff";
        regular5 = "0xd4bfff";
        regular6 = "0x83CEC6";
        regular7 = "0xf2f2f2";

        bright0 = "0x737d87";
        bright1 = "0xff3333";
        bright2 = "0xbae67e";
        bright3 = "0xffee99";
        bright4 = "0x73d0ff";
        bright5 = "0xb77ee0";
        bright6 = "0x5ccfe6";
        bright7 = "0xffffff";

        flash = "e6b450";
        flash-alpha = 0.4;

        #        "16" = "ffa066";
        #        "17" = "ff5d62";
      };
    };
  };
}



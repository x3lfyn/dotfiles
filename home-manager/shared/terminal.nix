{ inputs, outputs, lib, config, pkgs, ... }: {
  programs.alacritty = {
    enable = true;
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



{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: let
  makeCommand = command: {
    command = [command];
  };
in {
  programs.niri = {
    enable = true;
    settings = {
      layer-rules = [
      	{
	  	  matches = [{namespace = "swww-daemon";}];
	  	  place-within-backdrop = true;
	  	}
	  ];
      environment = {
        CLUTTER_BACKEND = "wayland";
        DISPLAY = null;
        GDK_BACKEND = "wayland,x11";
        MOZ_ENABLE_WAYLAND = "1";
        NIXOS_OZONE_WL = "1";
        QT_QPA_PLATFORM = "wayland;xcb";
        QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
        SDL_VIDEODRIVER = "wayland";
        _JAVA_OPTIONS = "-Dawt.useSystemAAFontSettings=on";
        _JAVA_AWT_WM_NONREPARENTING = "1";
      };
      spawn-at-startup = [
        (makeCommand "waybar")
        (makeCommand "nm-applet")
        (makeCommand "blueman-applet")
        (makeCommand "swww-daemon")
      ];
      input = {
        focus-follows-mouse.enable = true;
        warp-mouse-to-focus.enable = true;
        workspace-auto-back-and-forth = true;
        touchpad = {
          click-method = "button-areas";
          dwt = true;
          dwtp = true;
          natural-scroll = true;
          scroll-method = "two-finger";
          tap = true;
          tap-button-map = "left-right-middle";
          middle-emulation = true;
          accel-profile = "adaptive";
        };
        keyboard.xkb = {
			layout = "us,ru";
			options = "grp:win_space_toggle";
		};
      };
      outputs = {
        "eDP-1" = {
          scale = 1.5;
          position = {
            x = 0;
            y = 0;
          };
        };
      };
      overview = {
        backdrop-color = "transparent";
      };
      gestures = {hot-corners.enable = true;};
      cursor = {
        size = 24;
        theme = "${config.home.pointerCursor.name}";
      };
      layout = {
        focus-ring.enable = false;
        border = {
          enable = true;
          width = 2;
          active.color = "#7fb4ca";
          inactive.color = "#090e13";
        };
        shadow = {
          enable = false;
        };
        preset-column-widths = [
          {proportion = 0.25;}
          {proportion = 0.5;}
          {proportion = 0.75;}
          {proportion = 1.0;}
        ];
        default-column-width = {proportion = 0.5;};

        gaps = 4;
        struts = {
          left = 0;
          right = 0;
          top = 0;
          bottom = 0;
        };

        tab-indicator = {
          hide-when-single-tab = true;
          place-within-column = true;
          position = "left";
          corner-radius = 20.0;
          gap = -12.0;
          gaps-between-tabs = 10.0;
          width = 4.0;
          length.total-proportion = 0.1;
        };
      };
      prefer-no-csd = true;
      binds = with config.lib.niri.actions; let
        playerctl = spawn "${pkgs.playerctl}/bin/playerctl";
        set-volume = spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@";
      in {
        "XF86AudioMute".action = spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle";
        "XF86AudioPlay".action = playerctl "play-pause";
        "XF86AudioStop".action = playerctl "pause";
        "XF86AudioPrev".action = playerctl "previous";
        "XF86AudioNext".action = playerctl "next";
        "XF86AudioRaiseVolume".action = spawn "sh" "~/.scripts/volume.sh" "--up";
        "XF86AudioLowerVolume".action = spawn "sh" "~/.scripts/volume.sh" "--down";

        "Ctrl+Space".action = spawn "rofi" "-show" "drun";
        "Mod+Return".action = spawn "foot";

        "Mod+Q".action = close-window;
        "Mod+F".action = maximize-column;
        "Mod+Shift+F".action = expand-column-to-available-width;
        "Mod+S".action = toggle-window-floating;
        "Mod+Tab".action = switch-focus-between-floating-and-tiling;
        "Mod+C".action = center-visible-columns;
        "Mod+Alt+Left".action = set-column-width "-10%";
        "Mod+Alt+Right".action = set-column-width "+10%";
        "Mod+Alt+Down".action = set-window-height "-10%";
        "Mod+Alt+Up".action = set-window-height "+10%";
        "Mod+Grave".action = toggle-overview;

        "Mod+Left".action = focus-column-left;
        "Mod+Right".action = focus-column-right;
        "Mod+Down".action = focus-window-or-workspace-down;
        "Mod+Up".action = focus-window-or-workspace-up;

        "Mod+Shift+Left".action = move-column-left;
        "Mod+Shift+Right".action = move-column-right;
        "Mod+Shift+Down".action = move-column-to-workspace-up;
        "Mod+Shift+Up".action = move-column-to-workspace-down;

        "Mod+1".action = focus-workspace 1;
        "Mod+2".action = focus-workspace 2;
        "Mod+3".action = focus-workspace 3;
        "Mod+4".action = focus-workspace 4;
        "Mod+5".action = focus-workspace 5;
        "Mod+6".action = focus-workspace 6;
        "Mod+7".action = focus-workspace 7;
        "Mod+8".action = focus-workspace 8;
        "Mod+9".action = focus-workspace 9;
        "Mod+0".action = focus-workspace 10;
      };
    };
  };
}

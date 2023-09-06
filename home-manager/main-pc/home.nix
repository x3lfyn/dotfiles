{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ../shared
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    enableNvidiaPatches = true;

    xwayland = {
      enable = true;
    };

    extraConfig = ''
      monitor = HDMI-A-1,2560x1080@75,0x0,1

        animations {
          enabled = true

          bezier = overshot, 0.05, 0.9, 0.1, 1.05
          bezier = smoothOut, 0.36, 0, 0.66, -0.56
          bezier = smoothIn, 0.25, 1, 0.5, 1

          animation = windows, 1, 5, overshot, slide
          animation = windowsOut, 1, 4, smoothOut, slide
          animation = windowsMove, 1, 4, default
          animation = border, 1, 5, default
          animation = fade, 1, 5, smoothIn
          animation = fadeDim, 1, 5, smoothIn
          animation = workspaces, 1, 6, default
        }
    '' + (import ../shared/hyprland-config.nix);
  };

  programs.waybar.style = ''
            #workspaces button {
            	padding: 0px 3px;
            	background-color: @bg;
            	border-radius: 0px;
            }

            #workspaces button label {
            	min-width: 16px;
            	padding: 0px;
            	margin: 5px 0px;
            	border-radius: 8px;
            	color: transparent;
            	font-size: 8px;

            	background: @disabledFg;
            }

            #workspaces button.active label {
            	background: @fg;
            	min-width: 26px;
            }
  '' + (import ../shared/waybar-style.nix);

  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = ~/Pictures/wallpapers/wallhaven-r7ywwm.png
    preload = ~/Pictures/wallpapers/wallhaven-2ygz3x.jpg
    #wallpaper = HDMI-A-1,~/Pictures/wallpapers/wallhaven-2ygz3x.jpg
    wallpaper = HDMI-A-1,~/Pictures/wallpapers/wallhaven-r7ywwm.png
  '';
}

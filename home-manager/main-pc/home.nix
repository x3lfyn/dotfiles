{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ../shared
  ];

  wayland.windowManager.hyprland = {
    enable = true;

    xwayland = {
      enable = true;
    };

    extraConfig = ''
      monitor = HDMI-A-1,2560x1080@75,0x0,1

        animations {
          enabled = true

          bezier = ease,0.4,0.02,0.21,1

          animation = windows, 1, 3.5, ease, slide
          animation = windowsOut, 1, 3.5, ease, slide
          animation = border, 1, 6, default
          animation = fade, 1, 3, ease
          animation = workspaces, 1, 3.5, ease
        }

        decoration {
          rounding = 10

          blur {
            enabled = true
            size = 7
            passes = 2
            new_optimizations = on
          }

          drop_shadow = no
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
    preload = ~/Pictures/wallpapers/wallhaven-e7d368.jpg
    wallpaper = HDMI-A-1,~/Pictures/wallpapers/wallhaven-e7d368.jpg
  '';
}

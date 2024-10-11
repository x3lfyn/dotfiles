args @ {
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ../shared
    (import ../shared/xdg-mime.nix (args // {defaultBrowserDesktop = "firefox.desktop";}))
  ];

  wayland.windowManager.hyprland = {
    enable = true;

    xwayland = {
      enable = true;
    };

    systemd.variables = ["--all"];

    extraConfig =
      ''
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

        input {
          kb_layout = us, ru
          kb_variant =
          kb_model =
          kb_options = grp:win_space_toggle
          kb_rules =
          numlock_by_default = 1
          follow_mouse = 1
          sensitivity = 0
          accel_profile = flat

          touchpad {
        	natural_scroll = true
        	scroll_factor = 0.15
          }
        }
      ''
      + (import ../shared/hyprland-config.nix);
  };

  programs.waybar.style =
    ''
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
    ''
    + (import ../shared/waybar-style.nix);

  programs.waybar.settings.mainBar.modules-left = pkgs.lib.mkAfter ["mpris"];
  progams.waybar.settings.mainBar.modules-center = ["hyprland/window"];

  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = ~/Pictures/wallpapers/wallhaven-e7d368.jpg
    wallpaper = HDMI-A-1,~/Pictures/wallpapers/wallhaven-e7d368.jpg
  '';
}

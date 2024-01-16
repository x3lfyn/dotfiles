{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ../shared
  ];

  home.packages = with pkgs; [
    brightnessctl
    packettracer
  ];

  wayland.windowManager.hyprland = {
    enable = true;

    xwayland = {
      enable = true;
    };

    extraConfig = ''
      monitor = eDP-1,2256x1504,0x0,1.566667

      animations {
        enabled = false
      }

      xwayland {
        force_zero_scaling = true
      }

        decoration {
          rounding = 0

          blur {
            enabled = false
          }

          drop_shadow = false
        }
    '' + (import ../shared/hyprland-config.nix);
  };

  programs.waybar.style = ''
      #workspaces button {
        padding: 0px 1px;
        background-color: @bg;
        border-radius: 0px;
      }

      #workspaces button label {
        min-width: 8px;
        padding: 0px;
        margin: 6px 0px;
        border-radius: 8px;
        color: transparent;
        font-size: 8px;

        background: @disabledFg;
      }

      #workspaces button.active label {
        background: @fg;
        min-width: 10px;
      }
  '' + (import ../shared/waybar-style.nix);

  programs.waybar.settings.mainBar.modules-left = pkgs.lib.mkAfter [ "battery" "network" ];
  programs.waybar.settings.mainBar.modules-right = pkgs.lib.mkBefore [ "backlight" ];

  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = ~/Pictures/wallpapers/pinterest_girl_space_upscaled.png
    wallpaper = eDP-1,~/Pictures/wallpapers/pinterest_girl_space_upscaled.png
  '';
}

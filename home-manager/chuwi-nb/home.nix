{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ../shared
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    enableNvidiaPatches = false;

    xwayland = {
      enable = true;
    };

    extraConfig = ''
      monitor = eDP-1,2256x1504,0x0,1.5

      animations {
        enabled = false
      }

      xwayland {
        force_zero_scaling = true
      }
    '' + (import ../shared/hyprland-config.nix);
  };


  programs.waybar.settings.mainBar.modules-left = pkgs.lib.mkAfter [ "battery" ];
  programs.waybar.settings.mainBar.modules-right = pkgs.lib.mkBefore [ "network" ];

  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = ~/Pictures/wallpapers/wallpaperflare.com_wallpaper.jpg
    wallpaper = eDP-1,~/Pictures/wallpapers/wallpaperflare.com_wallpaper.jpg
  '';
}

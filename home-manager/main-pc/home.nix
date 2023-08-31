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

  home.file.".config/hypr/hyprpaper.conf".text = ''
      preload = ~/Pictures/wallpapers/wallhaven-r7ywwm.png
      preload = ~/Pictures/wallpapers/wallhaven-2ygz3x.jpg
      #wallpaper = HDMI-A-1,~/Pictures/wallpapers/wallhaven-2ygz3x.jpg
      wallpaper = HDMI-A-1,~/Pictures/wallpapers/wallhaven-r7ywwm.png
  '';
}

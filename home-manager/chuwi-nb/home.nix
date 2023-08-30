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
    '' + (import ../shared/hyprland-config.nix);
  };
}

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
    monitor = ,highres,auto,auto
    '' + (import ../shared/hyprland-config.nix);
  };
}

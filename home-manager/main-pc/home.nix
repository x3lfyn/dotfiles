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
    '' + (import ../shared/hyprland-config.nix);
  };
}

# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{
  inputs,
  lib,
  config,
  pkgs,
  myHmModules,
  ...
}: {
  home-manager.users.vobbla16 = {...}: {
    imports = [../../home-manager/lawine/home.nix] ++ myHmModules;
  };

  imports = [
    ../shared
    ./hardware-configuration.nix
  ];

  services.printing = {
    enable = true;
    drivers = with pkgs; [
      gutenprint
      hplip
    ];
  };

  boot.loader.timeout = 0;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  programs.nix-ld.enable = true;

  networking.hostName = "lawine";

  services.ratbagd.enable = true;
  services.flatpak.enable = true;

  services.xserver.videoDrivers = ["nvidia"];

  environment.systemPackages = with pkgs; [
    libva
    nvidia-vaapi-driver
    egl-wayland
    gscan2pdf

    bore-cli
  ];

  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    nvidiaSettings = true;
    powerManagement.enable = true;
  };

  hardware.opengl.extraPackages = with pkgs; [
    vaapiVdpau
    libvdpau-va-gl

    nvidia-vaapi-driver
  ];

  hardware.sane = {
    enable = true;
    extraBackends = [pkgs.hplipWithPlugin];
  };

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "nvidia";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    WLR_NO_HARDWARE_CURSORS = "1";
    NVD_BACKEND = "direct";
    MOZ_DISABLE_RDD_SANDBOX = "1";
  };
}

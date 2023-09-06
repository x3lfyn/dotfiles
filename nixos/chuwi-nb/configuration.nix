{ config, pkgs, ... }:
{
  imports =
    [
      ../shared
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "CHUWI-NB-NIX";

  hardware.opengl.extraPackages = with pkgs; [
    vaapiVdpau
    intel-media-driver
    vaapiIntel
    libvdpau-va-gl
  ];

  environment.systemPackages = with pkgs; [
#    libva-utils
  ];

  environment.sessionVariables = {
#    GDK_SCALE = "2";
  };
}

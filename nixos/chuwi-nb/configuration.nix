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

  services.tlp = {
    enable = true;
    settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
	CPU_BOOST_ON_BAT = "0";
    };
  };
  powerManagement = {
    enable = true;
    powertop.enable = true;
  };
  services.thermald.enable = true;
}

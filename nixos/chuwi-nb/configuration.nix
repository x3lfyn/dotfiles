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

  environment.variables = {
    VDPAU_DRIVER = "va_gl";
  };

  services.tlp = {
    enable = true;
    settings = {
      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

      PLATFORM_PROFILE_ON_BAT = "low-power";
      PLATFORM_PROFILE_ON_AC = "performance";

      CPU_BOOST_ON_AC = "1";
      CPU_BOOST_ON_BAT = "1";
      CPU_HWP_DYN_BOOST_ON_AC = "1";
      CPU_HWP_DYN_BOOST_ON_BAT = "1";
    };
  };
  powerManagement = {
    enable = true;
    powertop.enable = true;
  };
  services.thermald.enable = true;

  programs.nix-ld.dev.enable = true;

  networking.extraHosts = ''
    0.0.0.0 cisco.com www.cisco.com
  '';
}

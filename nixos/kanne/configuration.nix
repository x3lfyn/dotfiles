{
  config,
  pkgs,
  myHmModules,
  ...
}: {
  imports = [
    ../shared
    ./hardware-configuration.nix
  ];

  home-manager.users.vobbla16 = {...}: {
    imports = [../../home-manager/kanne/home.nix] ++ myHmModules;
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "kanne";

  programs.nix-ld.enable = true;

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
      CPU_ENERGY_PERF_POLICY_ON_AC = "balance_performance";

      PLATFORM_PROFILE_ON_BAT = "balanced";
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

  networking.extraHosts = ''
    0.0.0.0 cisco.com www.cisco.com

    10.10.11.235 drive.htb
  '';
}

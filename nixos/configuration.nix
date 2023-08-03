# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)

{ inputs, outputs, lib, config, pkgs, ... }: {
  # You can import other NixOS modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/nixos):
    # outputs.nixosModules.example

    # Or modules from other flakes (such as nixos-hardware):
    # inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-ssd

    # You can also split up your configuration and import pieces of it here:
    # ./users.nix

    # Import your generated (nixos-generate-config) hardware configuration
    ./hardware-configuration.nix
  ];

  boot.loader.timeout = 0;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages;

  systemd.services.NetworkManager-wait-online.enable = false;

  networking.hostName = "MAIN-PC-NIX"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  services.ratbagd.enable = true;
  programs.adb.enable = true;
  virtualisation.docker.enable = true;

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
    videoDrivers = [
      "nvidia"
    ];
#    displayManager.lightdm.enable = true;
    libinput.enable = true;
  };

  services.greetd = {
    enable = true;
    settings = rec {
      default_session = {
#        command = "${pkgs.hyprland}/bin/Hyprland";
         command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
      };
    };
  };

  environment.etc."greetd/environments".text = ''
Hyprland
zsh
  '';

  users.users.vobbla16 = {
    isNormalUser = true;
    description = "vobbla16";
    extraGroups = [ "networkmanager" "wheel" "adbusers" "docker" "hidrawgrp" ];
    packages = with pkgs; [];
    shell = pkgs.zsh;
  };

  users.groups.hidrawgrp = {};

  services.udev.packages = [
    pkgs.android-udev-rules
  ];

  services.udev.extraRules = ''
KERNEL=="hidraw*", SUBSYSTEM=="hidraw", MODE="0660", GROUP="hidrawgrp"
  '';
  
  services.udisks2 = {
    enable = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  nix = {
    # This will add each flake input as a registry
    # To make nix3 commands consistent with your flake
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;

    # This will additionally add your inputs to the system's legacy channels
    # Making legacy nix commands consistent as well, awesome!
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;

    settings = {
      # Enable flakes and new 'nix' command
      experimental-features = "nix-command flakes";
      # Deduplicate and optimize nix store
      auto-optimise-store = true;
    };
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neovim
    polkit_gnome
    pulseaudio
    git

    libva
    nvidia-vaapi-driver
    egl-wayland

    greetd.greetd
    greetd.tuigreet

    wireguard-tools
  ];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  hardware.nvidia = {
    modesetting.enable = true;
    open = true;
    nvidiaSettings = true;
    powerManagement.enable = false;
  };

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;

    extraPackages = with pkgs; [
      vaapiVdpau
      libvdpau-va-gl

      nvidia-vaapi-driver
    ];
  };
  programs.xwayland.enable = true;

  programs.zsh.enable = true;

  hardware.bluetooth = {
    enable = true;
    settings = {
      General = {
        Experimental = true;
	KernelExperimental = true;
      };
    };
  };
  services.blueman.enable = true;

  services.upower.enable = true;

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  environment.etc = {
    "wireplumber/bluetooth.lua.d/51-bluez-config.lua".text = ''
      bluez_monitor.properties = {
        ["bluez5.enable-sbc-xq"] = true,
        ["bluez5.enable-msbc"] = true,
        ["bluez5.enable-hw-volume"] = true,
        ["bluez5.headset-roles"] = "[ hsp_hs hsp_ag hfp_hf hfp_ag ]"
      }
    '';
  };

  security.polkit.enable = true;

  security.pki.certificateFiles = [ ./hn-root-ca.crt ];

  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };

  security.sudo.extraConfig = ''
Defaults pwfeedback
  '';

  environment.pathsToLink = [ "/share/zsh" ];

  fonts.fontconfig = {
    enable = true;
    antialias = true;
    defaultFonts = {
      monospace = [ "JetBrainsMono NF" ];
      sansSerif = [ "Inter" ];
      serif = [ "Roboto Slab" ];
    };
    hinting = {
      enable = true;
      style = "hintslight";
    };
  };
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}

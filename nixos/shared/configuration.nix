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
    #./hardware-configuration.nix
    inputs.nix-gaming.nixosModules.pipewireLowLatency
  ];

  #  boot.loader.timeout = 0;
  #  boot.loader.systemd-boot.enable = true;
  #  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages;

  systemd.services.NetworkManager-wait-online.enable = false;

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config.common.default = "*";
  };

  #  networking.hostName = "MAIN-PC-NIX"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  #  services.ratbagd.enable = true;
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
    #    videoDrivers = [
    #      "nvidia"
    #    ];
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

  services.gvfs.enable = true;
  services.fstrim.enable = true;

  environment.etc."greetd/environments".text = ''
    Hyprland
    zsh
  '';

  users.users.vobbla16 = {
    isNormalUser = true;
    description = "vobbla16";
    extraGroups = [ "networkmanager" "wheel" "adbusers" "docker" "hidrawgrp" "scanner" "lp" ];
    packages = with pkgs; [ ];
    shell = pkgs.zsh;
  };

  users.groups.hidrawgrp = { };

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

      substituters = [ "https://ezkea.cachix.org" "https://hyprland.cachix.org" ];
      trusted-public-keys = [ "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI=" "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
    };
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neovim
    polkit_gnome
    pulseaudio
    libpulseaudio
    git

    #    libva
    #    nvidia-vaapi-driver
    #    egl-wayland
    ffmpeg
    libva-utils

    greetd.greetd
    greetd.tuigreet

    wireguard-tools
    openvpn

    xorg.libX11
  ];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  #  hardware.nvidia = {
  #    modesetting.enable = true;
  #    open = false;
  #    nvidiaSettings = true;
  #    powerManagement.enable = true;
  #  };

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;

    #    extraPackages = with pkgs; [
    #      vaapiVdpau
    #      libvdpau-va-gl

    #      nvidia-vaapi-driver
    #    ];
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

    lowLatency = {
      enable = true;
    };
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
      enable = false;
    };
  };
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable
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
  system.stateVersion = "23.11"; # Did you read the comment?

  networking.extraHosts = ''
    10.129.138.179 analytical.htb data.analytical.htb
  '';

  services.avahi = {
    enable = true;
    nssmdns = true;

    publish = {
      enable = true;
      addresses = true;
      domain = true;
      hinfo = true;
      userServices = true;
      workstation = true;
    };
  };
}

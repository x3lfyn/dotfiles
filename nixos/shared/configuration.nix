{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    #    inputs.nix-gaming.nixosModules.pipewireLowLatency
  ];

  boot.kernelPackages = pkgs.linuxPackages;

  systemd.services.NetworkManager-wait-online.enable = false;

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    config.common.default = "*";
  };

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Moscow";

  i18n.defaultLocale = "en_US.UTF-8";

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

  services.xserver = {
    layout = "us";
    xkbVariant = "";
    libinput.enable = true;
  };

  services.greetd = {
    enable = true;
    settings = rec {
      default_session = {
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

  nixpkgs = {
    config.allowUnfree = true;
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
    ];
  };

  nix = {
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;

    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;

    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
      builders-use-substitutes = true;

      substituters = [ "https://anyrun.cachix.org" "https://x3lfy.cachix.org" "https://ezkea.cachix.org" "https://hyprland.cachix.org" "https://tweag-jupyter.cachix.org" ];
      trusted-public-keys = [ "anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s=" "x3lfy.cachix.org-1:nNKLs5ryJhfCSzsbFmVKThjVqguUMkNeQzT3pBb8lTY=" "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI=" "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" "tweag-jupyter.cachix.org-1:UtNH4Zs6hVUFpFBTLaA4ejYavPo5EFFqgd7G7FxGW9g=" ];
    };
  };

  environment.systemPackages = with pkgs; [
    neovim
    polkit_gnome
    pulseaudio
    libpulseaudio
    git

    ffmpeg
    libva-utils

    greetd.greetd
    greetd.tuigreet

    wireguard-tools
    openvpn

    xorg.libX11
  ];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
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

  security.pam.services.swaylock = { };

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;

    #    lowLatency = {
    #      enable = true;
    #    };
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

  security.pki.certificateFiles = [ ./hn-root-ca.crt ./burp.pem ];

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
      monospace = [ "FantasqueSansM Nerd Font" ];
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

  services.openssh.enable = true;

  networking.firewall.enable = false;

  system.stateVersion = "23.11";

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

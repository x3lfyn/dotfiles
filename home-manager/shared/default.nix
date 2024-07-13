{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  imports = [
	inputs.hyprland.homeManagerModules.default
    inputs.nurpkgs.nixosModules.nur
    inputs.spicetify-nix.homeManagerModule
    inputs.anyrun.homeManagerModules.default

    ./terminal.nix
    ./waybar.nix
    ./shell.nix
    ./firefox.nix
    ./kdeconnect.nix
    ./syncthing.nix
    ./desktopEntries.nix
    ./spotify.nix
    ./xdg-mime.nix
    ./ssh.nix
    ./mako.nix
    ./zathura.nix
    ./gitgpg.nix
  ];

  #  xdg.configFile."nvim".source = pkgs.fetchFromGitHub {
  #    owner = "vobbla16";
  #    repo = "CyberNvim";
  #    rev = "e3cbcb64ebd1931c1e1d62fdf096a87a3153026f";
  #    sha256 = "sha256-lGXe2628xZPeNjfTder1hlgKp5Tw9B5Wobx7pz6A2xI=";
  #  };

  programs.anyrun = {
    enable = true;
    config = {
      plugins = with inputs.anyrun.packages.${pkgs.system}; [
        applications
        rink
      ];
      layer = "overlay";
    };
  };

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
      outputs.overlays.yukigram

      inputs.nurpkgs.overlay
    ];

    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);

      permittedInsecurePackages = [
        "electron-24.8.6"
        "electron-25.9.0"
      ];
    };
  };

  home.packages = with pkgs; [
    libnotify
    pavucontrol
    hyprpaper
    swww
    libqalculate
    slurp
    grim
    wl-clipboard
    rofi-power-menu
    rofi-bluetooth
    bc
    xorg.libX11
    xdg-utils
    btrfs-progs
    cava
    vesktop
    libappindicator-gtk3
    fuse
    fuse3
    xorg.xhost

    roboto-slab
    inter
    google-sans-display
    jetbrainsmono-nf-ligs
    noto-fonts-emoji

    screen
    grc
    duf
    du-dust
    dogdns
    tealdeer
    fd
    ripgrep
    fzf
    jq
    openssl
    unzip
    unrar
    file
    jless
    gping
    alsa-utils
    alsa-tools
    patchelf
    pciutils
    smartmontools
    tree
    usbutils
    wget
    p7zip
    zip
    cmake
    btop
    iptables
    mpv
    openvpn
    libsixel
    zip
    hyperfine
    glow
    killall
    p7zip
    socat
    yt-dlp
    hexyl

    gparted
    yukigram
    jetbrains-toolbox
    unstable.obsidian
    qview
    google-chrome
    libreoffice-fresh
    anki-bin
    qbittorrent

    dconf
    libsForQt5.qtstyleplugins
    gtk-engine-murrine
    gtk3
    playerctl
    git-crypt
    networkmanagerapplet
    corefonts
    noto-fonts-cjk-sans
    glib

    rustup
    gcc
    pkg-config
    libiconv
    openssl.dev
    (python3.withPackages (
      ps: with ps; [
        ipython
        pycryptodome
        requests
        gmpy2
        sympy
        pillow
        z3
        pwntools
      ]
    ))
    pypy3
    jdk
    gnumake
    scc

    # ctf things
    wireshark
    binwalk
    nmap
    jadx
    hashcat
    gdb
    exiftool
    exiv2
    stegsolve
    bkcrack
    ffuf
    bkcrack
    ghidra-bin
    radare2
    apktool
    gnome.ghex
    xortool
    sqlite
    frida-tools
    gef
    ltrace

    # libs
    xorg.libX11
    gtk3
    gtk4

    # devops
    ansible
    terraform
    dive
    trivy
    cachix

    jetbrains-mono

    burpsuite

    (nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
  ];

  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    theme = ./rofi.rasi;
    font = "Inter 12";
    extraConfig = {
      show-icons = true;
    };
  };

  dconf.enable = true;

  fonts.fontconfig = {
    enable = true;
  };

  services.udiskie.enable = true;

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };

  gtk = {
    enable = true;
    font = {
      name = "Inter";
      package = pkgs.inter;
      size = 10;
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
      gtk-decoration-layout = "menu:";
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
      gtk-decoration-layout = "menu:";
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    theme = {
      name = "Kanagawa-BL";
      package = pkgs.kanagawa-gtk-theme-lcl;
    };
  };

  home.pointerCursor = {
    package = pkgs.phinger-cursors;
    name = "phinger-cursors-dark";
    size = 24;
    x11.enable = true;
    gtk.enable = true;
  };

  home.file = {
    ".config/electron-flags.conf".text = ''
      --enable-features=UseOzonePlatform
      --ozone-platform=wayland
    '';
    ".config/electron13-flags.conf".text = ''
      --enable-features=UseOzonePlatform
      --ozone-platform=wayland
    '';
    ".config/electron15-flags.conf".text = ''
      --enable-features=UseOzonePlatform
      --ozone-platform=wayland
    '';
    ".config/electron18-flags.conf".text = ''
      --enable-features=UseOzonePlatform
      --ozone-platform=wayland
    '';
    ".config/electron19-flags.conf".text = ''
      --enable-features=UseOzonePlatform
      --ozone-platform=wayland
    '';
    ".config/electron22-flags.conf".text = ''
      --enable-features=UseOzonePlatform
      --ozone-platform=wayland
    '';
    ".config/electron23-flags.conf".text = ''
      --enable-features=UseOzonePlatform
      --ozone-platform=wayland
    '';
    ".config/electron24-flags.conf".text = ''
      --enable-features=UseOzonePlatform
      --ozone-platform=wayland
    '';
    ".config/electron25-flags.conf".text = ''
      --enable-features=UseOzonePlatform
      --ozone-platform=wayland
    '';
    ".scripts/volume.sh".text = builtins.readFile ./scripts/volume.sh;
    ".scripts/screenshot.sh".text = builtins.readFile ./scripts/screenshot.sh;
    ".scripts/wireguard.sh".text = builtins.readFile ./scripts/wireguard.sh;
  };

  qt = {
    enable = true;
    style.name = "gtk2";
    platformTheme.name = "gtk";
  };

  home = {
    username = "vobbla16";
    homeDirectory = "/home/vobbla16";
    sessionVariables = {
      GTK_THEME = config.gtk.theme.name;
    };
  };

  services.gammastep = {
    enable = true;
    latitude = "52.422451";
    longitude = "31.014012";
    provider = "manual";
    tray = true;
  };

  programs.swaylock = {
    enable = true;
    package = pkgs.unstable.swaylock-effects;
    settings = {
      clock = true;
      screenshots = true;
      effect-blur = "15x10";
      fade-in = "0.2";
    };
  };

  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}

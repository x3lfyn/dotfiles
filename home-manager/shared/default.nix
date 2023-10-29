{ inputs, outputs, lib, config, pkgs, ... }: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
    inputs.hyprland.homeManagerModules.default
    inputs.nurpkgs.nixosModules.nur
    inputs.spicetify-nix.homeManagerModule

    ./terminal.nix
    #    ./hyprland.nix
    ./waybar.nix
    ./shell.nix
    ./firefox.nix
    ./kdeconnect.nix
    ./syncthing.nix
    ./desktopEntries.nix
    ./spotify.nix
    ./xdg-mime.nix
    ./ssh.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

      inputs.nurpkgs.overlay

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = (_: true);
    };
  };

  home.packages = with pkgs; [
    libnotify
    pavucontrol
    pulseaudio
    hyprpaper
    libqalculate
    slurp
    grim
    wl-clipboard
    rofi-power-menu
    rofi-bluetooth
    bc
    xorg.libX11
    gnome.file-roller
    xdg-utils
    btrfs-progs
    cava
    discord
    betterdiscordctl
    libappindicator-gtk3

    roboto-slab
    inter
    google-sans-display
    jetbrainsmono-nf-ligs
    noto-fonts-emoji

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

    gparted
    telegram-desktop
    jetbrains-toolbox
    obsidian
    qview
    google-chrome
    via
    wpsoffice

    dconf
    libsForQt5.qtstyleplugins
    gtk-engine-murrine
    gtk3
    playerctl
    git-crypt
    networkmanagerapplet
    corefonts
    noto-fonts-cjk-sans

    rustup
    gcc
    pkg-config
    libiconv
    openssl.dev
    python3
    jdk

    # ctf things
    binwalk
    nmap
    jadx
    python310Packages.ipython
    python310Packages.pycryptodome
    hashcat
    pwntools
    gdb
    exiftool
    exiv2
    stegsolve
    bkcrack
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

  programs.gh = {
    enable = true;
    enableGitCredentialHelper = true;
  };

  dconf.enable = true;

  fonts.fontconfig = {
    enable = true;
  };

  services.udiskie.enable = true;

  services.mako = {
    enable = true;
    anchor = "top-center";
    font = "Inter 12";
    backgroundColor = "#1f1f28";
    textColor = "#dcd7ba";
    progressColor = "#43242B";
    borderSize = 2;
    borderRadius = 10;
    padding = "8";
    iconPath = "${config.home.homeDirectory}/.nix-profile/share/icons/Papirus-Dark";
    layer = "overlay";
    defaultTimeout = 3000;
  };

  services.dunst = {
    enable = false;
    iconTheme = {
      package = config.gtk.iconTheme.package;
      name = config.gtk.iconTheme.name;
    };
    settings = {
      global = {
        width = 350;
        height = 200;
        origin = "top-center";
        progress_bar = true;
        progress_bar_height = 16;
        progress_bar_corner_radius = 4;
        indicate_hidden = true;
        notification_limit = 5;
        font = "Inter 12";
        frame_width = 2;
        frame_color = "#C8C093";
      };
    };
  };

  xdg.userDirs = {
    enable = true;
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
    package = pkgs.nur.repos.ambroisie.vimix-cursors;
    name = "Vimix-cursors";
    size = 28;
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
  };

  programs.gpg = {
    enable = true;
  };

  programs.git = {
    enable = true;
    userName = "vobbla16";
    userEmail = "novikovprojects@gmail.com";
    signing = {
      key = "F2EE41860B238D993139AF94C1190C108C849FA4";
      signByDefault = true;
    };
    lfs.enable = true;
    extraConfig = {
      core = {
        editor = "nvim";
      };
      color = {
        ui = true;
      };
      push = {
        default = "simple";
      };
      pull = {
        ff = "only";
      };
      init = {
        defaultBranch = "main";
      };
    };
  };

  qt = {
    enable = true;
    style = {
      name = "gtk2";
    };
    platformTheme = "gtk";
  };

  services.gpg-agent = {
    enable = true;
    enableZshIntegration = true;
  };

  home = {
    username = "vobbla16";
    homeDirectory = "/home/vobbla16";
    sessionVariables = {
      GTK_THEME = config.gtk.theme.name;
    };
  };


  programs.zathura = {
    enable = true;
    options = {
      adjust-open = "best-fit";

      pages-per-row = 1;

      scroll-step = 100;
      zoom-min = 10;
      scroll-page-aware = "true";
      smooth-scroll = "true";
      guioptions = "sv";
      selection-clipboard = "clipboard";

      font = "JetBrainsMono NF 10";

      notification-error-bg = "#1F1F28";
      notification-error-fg = "#FF5D62";
      notification-warning-bg = "#1F1F28";
      notification-warning-fg = "#FFA066";
      notification-bg = "#1F1F28";
      notification-fg = "#DCD7BA";

      completion-bg = "#1F1F28";
      completion-fg = "#C8C093";
      completion-group-bg = "#2A2A37";
      completion-group-fg = "#C8C093";
      completion-highlight-bg = "#957FB8";
      completion-highlight-fg = "#1F1F28";

      index-bg = "#1F1F28";
      index-fg = "#957FB8";
      index-active-bg = "#957FB8";
      index-active-fg = "#1F1F28";

      inputbar-bg = "#1F1F28";
      inputbar-fg = "#C8C093";

      statusbar-bg = "#1F1F28";
      statusbar-fg = "#C8C093";

      highlight-color = "#FFA066";
      highlight-active-color = "#FF5D62";

      default-bg = "#1F1F28";
      default-fg = "#C8C093";
      render-loading = "true";
      render-loading-bg = "#1F1F28";
      render-loading-fg = "#C8C093";

      recolor-lightcolor = "#1F1F28";
      recolor-darkcolor = "#C8C093";
      recolor = "true";
    };
  };

  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}

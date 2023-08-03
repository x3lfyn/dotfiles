{ inputs, outputs, lib, config, pkgs, nix-colors, ... }: {
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

    nix-colors.homeManagerModules.default

    ./terminal.nix
    ./hyprland.nix
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

  colorScheme = nix-colors.colorSchemes.catppuccin-mocha;

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

  home.packages = [
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    pkgs.libnotify
    pkgs.pavucontrol
    pkgs.pulseaudio
    pkgs.hyprpaper
    pkgs.libqalculate
    pkgs.slurp
    pkgs.grim
    pkgs.wl-clipboard
    pkgs.rofi-power-menu
    pkgs.rofi-bluetooth
    pkgs.bc
    pkgs.xorg.libX11
    pkgs.gnome.file-roller
    pkgs.xdg-utils
    pkgs.btrfs-progs

    pkgs.roboto-slab
    pkgs.inter
    pkgs.google-sans-display
    pkgs.jetbrainsmono-nf-ligs

    pkgs.grc
    pkgs.duf
    pkgs.du-dust
    pkgs.dogdns
    pkgs.tealdeer
    pkgs.fd
    pkgs.ripgrep
    pkgs.fzf
    pkgs.jq
    pkgs.openssl
    pkgs.unzip
    pkgs.unrar
    pkgs.file

    pkgs.gparted
    pkgs.telegram-desktop
    pkgs.jetbrains-toolbox
    pkgs.obsidian
    pkgs.qview
#    pkgs.lutris
    pkgs.google-chrome
    pkgs.via

    pkgs.dconf
    pkgs.libsForQt5.qtstyleplugins
    pkgs.gtk-engine-murrine
    pkgs.gtk3
    pkgs.playerctl
    pkgs.git-crypt
  ];

  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    theme = ./rofi.rasi;
    font = "JetBrainsMono NF 12";
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
      package = pkgs.nerdfonts;
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
  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
    ".config/hypr/hyprpaper.conf".text = ''
preload = ~/Pictures/wallpapers/wallhaven-r7ywwm.png
preload = ~/Pictures/wallpapers/wallhaven-2ygz3x.jpg
#wallpaper = HDMI-A-1,~/Pictures/wallpapers/wallhaven-2ygz3x.jpg
wallpaper = HDMI-A-1,~/Pictures/wallpapers/wallhaven-r7ywwm.png
    '';

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
  };


  programs.zathura = {
    enable = true;
    options = {
	    adjust-open       ="best-fit";

	    pages-per-row =1;

	    scroll-step = 100;
	    zoom-min = 10;
	    scroll-page-aware     ="true";
	    smooth-scroll         ="true";
	    guioptions            ="sv";
	    selection-clipboard   ="clipboard";

	    font                  ="JetBrainsMono NF 10";

	    notification-error-bg       ="#1F1F28";
	    notification-error-fg       ="#FF5D62";
	    notification-warning-bg     ="#1F1F28";
	    notification-warning-fg     ="#FFA066";
	    notification-bg             ="#1F1F28";
	    notification-fg             ="#DCD7BA";

	    completion-bg               ="#1F1F28";
	    completion-fg               ="#C8C093";
	    completion-group-bg         ="#2A2A37";
	    completion-group-fg         ="#C8C093";
	    completion-highlight-bg     ="#957FB8";
	    completion-highlight-fg     ="#1F1F28";

	    index-bg                    ="#1F1F28";
	    index-fg                    ="#957FB8";
	    index-active-bg             ="#957FB8";
	    index-active-fg             ="#1F1F28";

	    inputbar-bg                 ="#1F1F28";
	    inputbar-fg                 ="#C8C093";

	    statusbar-bg                ="#1F1F28";
	    statusbar-fg                ="#C8C093";

	    highlight-color             ="#FFA066";
	    highlight-active-color      ="#FF5D62";

	    default-bg                  ="#1F1F28";
	    default-fg                  ="#C8C093";
	    render-loading              ="true";
	    render-loading-bg           ="#1F1F28";
	    render-loading-fg           ="#C8C093";

	    recolor-lightcolor          ="#1F1F28";
	    recolor-darkcolor           ="#C8C093";
	    recolor                     ="true";
    };
  };

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  # home.packages = with pkgs; [ steam ];

  # Enable home-manager and git
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}

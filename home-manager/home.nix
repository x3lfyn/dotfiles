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

    nix-colors.homeManagerModules.default
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

    pkgs.rofi-wayland
    pkgs.libnotify
    pkgs.pavucontrol
    pkgs.pulseaudio
    pkgs.hyprpaper

    pkgs.roboto
    pkgs.roboto-mono
    pkgs.nerdfonts

    pkgs.grc
    pkgs.duf
    pkgs.du-dust

    pkgs.gparted
    pkgs.telegram-desktop
    pkgs.spotify
  ];


  wayland.windowManager.hyprland = {
    enable = true;
    nvidiaPatches = true;
    extraConfig = ''
      env = LIBVA_DRIVER_NAME,nvidia
      env = XDG_SESSION_TYPE,wayland
      env = GBM_BACKEND,nvidia-drm
      env = __GLX_VENDOR_LIBRARY_NAME,nvidia
      env = WLR_NO_HARDWARE_CURSORS,1

      env = GDK_BACKEND,wayland,x11
      env = QT_QPA_PLATFORM,wayland;xcb
      env = SDL_VIDEODRIVER,wayland
      env = CLUTTER_BACKEND,wayland
      env = MOZ_ENABLE_WAYLAND,1

      exec-once = waybar
      exec-once = hyprpaper

      monitor = HDMI-A-1,2560x1080@75,0x0,1

      input {
          kb_layout = us, ru
          kb_variant =
          kb_model =
          kb_options = grp:win_space_toggle
          kb_rules =
          numlock_by_default = 1
          follow_mouse = 2
          sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
      }

      general {
          gaps_in = 2
	  gaps_out = 1
	  border_size = 2
	  col.active_border = rgba(dcd7baee)
	  col.inactive_border = rgba(727169ee)
      }

      decoration {
          rounding = 10
	  blur = yes
	  blur_size = 5
	  blur_passes = 1
	  blur_new_optimizations = on

	  drop_shadow = yes
	  shadow_range = 4
	  shadow_render_power = 3
	  col.shadow = rgba(717c7cee)
      }

      animations {
          enabled = true

          bezier = overshot, 0.05, 0.9, 0.1, 1.05
          bezier = smoothOut, 0.36, 0, 0.66, -0.56
          bezier = smoothIn, 0.25, 1, 0.5, 1

          animation = windows, 1, 5, overshot, slide
          animation = windowsOut, 1, 4, smoothOut, slide
          animation = windowsMove, 1, 4, default
          animation = border, 1, 5, default
          animation = fade, 1, 5, smoothIn
          animation = fadeDim, 1, 5, smoothIn
          animation = workspaces, 1, 6, default
      }

      bind = SUPER, Return, exec, alacritty
      bind = CONTROL, SPACE, exec, rofi -show drun

      bind = SUPER, q, killactive
      bind = SUPER_ALT, q, exit
      bind = SUPER, s, togglefloating
      bind = SUPER, f, fullscreen

      bind = SUPER, left, movefocus, l
      bind = SUPER, right, movefocus, r
      bind = SUPER, up, movefocus, u
      bind = SUPER, down, movefocus, d
      bind = SUPER, c, togglesplit

      bind = SUPER SHIFT, left, movewindow, l
      bind = SUPER SHIFT, right, movewindow, r
      bind = SUPER SHIFT, up, movewindow, u
      bind = SUPER SHIFT, down, movewindow, d

      bind = SUPER, 1, workspace, 1
      bind = SUPER, 2, workspace, 2
      bind = SUPER, 3, workspace, 3
      bind = SUPER, 4, workspace, 4
      bind = SUPER, 5, workspace, 5
      bind = SUPER, 6, workspace, 6
      bind = SUPER, 7, workspace, 7
      bind = SUPER, 8, workspace, 8
      bind = SUPER, 9, workspace, 9
      bind = SUPER, 0, workspace, 10

      bind = SUPER SHIFT, 1, movetoworkspacesilent, 1
      bind = SUPER SHIFT, 2, movetoworkspacesilent, 2
      bind = SUPER SHIFT, 3, movetoworkspacesilent, 3
      bind = SUPER SHIFT, 4, movetoworkspacesilent, 4
      bind = SUPER SHIFT, 5, movetoworkspacesilent, 5
      bind = SUPER SHIFT, 6, movetoworkspacesilent, 6
      bind = SUPER SHIFT, 7, movetoworkspacesilent, 7
      bind = SUPER SHIFT, 8, movetoworkspacesilent, 8
      bind = SUPER SHIFT, 9, movetoworkspacesilent, 9
      bind = SUPER SHIFT, 0, movetoworkspacesilent, 10

      bind = SUPER, mouse_down, workspace, e+1
      bind = SUPER, mouse_up, workspace, e-1

      bindm = SUPER, mouse:272, movewindow
      bindm = SUPER, mouse:273, resizewindow
    '';
  };

  fonts.fontconfig = {
    enable = true;
  };

  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal = {
          family = "RobotoMono Nerd Font";
	  style = "Regular";
	};
        bold = {
          family = "RobotoMono Nerd Font";
	  style = "Bold";
	};
        italic = {
          family = "RobotoMono Nerd Font";
	  style = "Italic";
	};
        bold_italic = {
          family = "RobotoMono Nerd Font";
	  style = "Bold Italic";
	};
	size = 11;
      };
      env = {
        TERM = "xterm-256color";
      };
      window = {
        padding = {
          x = 8;
	  y = 8;
	};
	opacity = 0.9;
      };
      dynamic_title = true;
      scrolling = {
        history = 20000;
      };
      cursor = {
        style = "Beam";
      };
      colors = {
        primary = {
#          background = "0x1f1f28";
          background = "0x${config.colorScheme.colors.base00}";
#	  foreground = "0xdcd7ba";
	  foreground = "0x${config.colorScheme.colors.base05}";
	};
        selection = {
          background = "0x${config.colorScheme.colors.base02}";
	  foreground = "0x${config.colorScheme.colors.base05}";
	};
	normal = {
          black = "0x${config.colorScheme.colors.base01}";
	  red = "0x${config.colorScheme.colors.base08}";
	  green = "0x${config.colorScheme.colors.base0B}";
	  yellow = "0x${config.colorScheme.colors.base0A}";
	  blue = "0x${config.colorScheme.colors.base0D}";
	  magenta = "0x${config.colorScheme.colors.base0E}";
	  cyan = "0x${config.colorScheme.colors.base0C}";
	  white = "0x${config.colorScheme.colors.base05}";
	};
	bright = {
          black = "0x${config.colorScheme.colors.base03}";
	  red = "0x${config.colorScheme.colors.base08}";
	  green = "0x${config.colorScheme.colors.base0B}";
	  yellow = "0x${config.colorScheme.colors.base0A}";
	  blue = "0x${config.colorScheme.colors.base0D}";
	  magenta = "0x${config.colorScheme.colors.base0E}";
	  cyan = "0x${config.colorScheme.colors.base0C}";
	  white = "0x${config.colorScheme.colors.base07}";
	};
#	draw_bold_text_with_bright_colors = false;
      };
    };
  };

  programs.firefox = {
    enable = true;
  };

  programs.exa.enable = true;
  programs.bat.enable = true;

  programs.zsh = {
    enable = true;
    autocd = true;
    shellAliases = {
      v="nvim";
      ls="exa -lah";
      cat="bat --color always --plain";
      free="grc --colour=auto free -h";
      ip="ip -c=auto";
      dig="grc --colour=auto dig";
      ping="grc --colour=auto ping";
      df="duf";
      du="dust";
    };
    history = {
      size = 20000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
    enableAutosuggestions = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;
    initExtra = ''
      preexec() { print -Pn "\e]0;%~\a" }

      bindkey "^[[H" beginning-of-line
      bindkey "^[[F" end-of-line
      bindkey "^[[3~" delete-char
      bindkey "^H" backward-kill-word
      bindkey "^[[3;5~" kill-word
      bindkey "^[[1;5C" forward-word
      bindkey "^[[1;5D" backward-word
    '';
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
#    settings = {

#    };
  };

  services.mako = {
    enable = true;
    anchor = "top-center";
    font = "Roboto Mono 12";
  };

  programs.waybar = {
    enable = true;
    package = pkgs.waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    });
    settings = {
      mainBar = {
        layer = "top";
	position = "top";
	height = 27;
	spacing = 5;
	modules-left = [ "wlr/workspaces" "cpu" "memory" ];
	modules-center = [ "hyprland/window" ];
	modules-right = [ "pulseaudio" "bluetooth" "hyprland/language" "clock" "tray" ];

	"wlr/workspaces" = {
          on-click = "activate";
	  sort-by-number = true;
	};
	"cpu" = {
          format = " {usage}%";
	};
	"memory" = {
          format = " {}%";
	};
	"clock" = {
          format = "󰥔 {:%d.%m.%Y %H:%M}";
	};
	"hyprland/language" = {
          format = "󰌌 {}";
	};
	"pulseaudio" = {
          format = "{volume}% {icon} {format_source}";
          format-bluetooth = "{volume}% {icon} 󰂰 {format_source}";
          format-bluetooth-muted = "󰝟 {icon} 󰂰 {format_source}";
          format-muted = "󰝟 {format_source}";
          format-source = "{volume}% 󰍬";
          format-source-muted = "󰍭";
          format-icons = {
            headphone = "󰋋";
            hands-free = "󰋎";
            headset = "󰋎";
            phone = "󰏲";
            portable = "<U+F095>";
            car = "󰄋";
            default = ["󰕿" "󰖀" "󰕾"];
          };
          on-click = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
          on-click-right = "pavucontrol";
	};
      };
    };
    style = ''
/*      @define-color bg #16161D;
      @define-color bg2 #223249; / waveBlue1 /
      @define-color bg3 #2D4F67; / waveBlue2 /
      @define-color bg4 #658594; / dragonBlue /
      @define-color fg #DCD7BA;
      @define-color red #C34043;
      @define-color dragonBlue #658594;
      @define-color autumnGreen #76946A;
      @define-color roninYellow #FF9E3B;
      @define-color katanaGray #717c7c;
      @define-color crystalBlue #7E9CD8;
      @define-color peachRed #FF5D62;*/

      @define-color bg #${config.colorScheme.colors.base01};
      @define-color fg #${config.colorScheme.colors.base05};
      @define-color defaultFg #${config.colorScheme.colors.base00};
      @define-color selectedBg #${config.colorScheme.colors.base02};
      @define-color cpuBg #${config.colorScheme.colors.base0F};
      @define-color memBg #${config.colorScheme.colors.base0C};
      @define-color pulseBg #${config.colorScheme.colors.base08};
      @define-color bluetoothBg #${config.colorScheme.colors.base0D};
      @define-color langBg #${config.colorScheme.colors.base06};
      @define-color clockBg #${config.colorScheme.colors.base0A};

      * {
        font-family: "JetBrainsMono NF", monospace;
	font-size: 12px;
      }

      window#waybar {
        background-color: @bg;
      }
      label {
        color: @defaultFg;
      }

      #workspaces label {
	color: @fg;
      }
      #workspaces button {
        padding: 0 5px;
	background-color: @bg;
	border-bottom: 2px solid transparent;
	border-radius: 0;
	min-width: 13px;
      }
      #workspaces button:hover {
        background: @bg;
	border-bottom: 2px solid @fg;
      }
      #workspaces button.active {
        background-color: @selectedBg;
	border-bottom: 2px solid @fg;
      }
      #workspaces button.urgent {
        background-color: @pulseBg;
      }

      #cpu, #memory, #language, #clock, #bluetooth, #pulseaudio {
        padding: 0 5px;
	margin: 0 2px;
      }

      #window {
	color: @fg;
      }
      #cpu {
        background-color: @cpuBg;
      }
      #memory {
        background-color: @memBg;
      }
      #language {
        background-color: @langBg;
      }
      #clock {
        background-color: @clockBg;
      }
      #bluetooth {
        background-color: @bluetoothBg;
      }
      #pulseaudio {
        background-color: @pulseBg;
	color: @fg;
      }
    '';
  };

  xdg.userDirs = {
    enable = true;
  };

  gtk = {
    enable = true;
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
wallpaper = HDMI-A-1,~/Pictures/wallpapers/wallhaven-r7ywwm.png
    '';
  };

  programs.gpg = {
    enable = true;
  };

  programs.git = {
    enable = true;
    userName = "vobbla16";
    userEmail = "novikovprojects@gmail.com";
#    signing = {
#      key = "";
#      signByDefault = true;
#    };
  };

  # TODO: Set your username
  home = {
    username = "vobbla16";
    homeDirectory = "/home/vobbla16";
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

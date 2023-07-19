{ inputs, outputs, lib, config, pkgs, nix-colors, ... }: {
  wayland.windowManager.hyprland = {
    enable = true;
    nvidiaPatches = true;

    xwayland = {
      enable = true;
      hidpi = false;
    };

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

exec-once = hyprpaper
exec-once = waybar
#exec-once = sleep 2
#exec-once = kdeconnect-indicator

monitor = HDMI-A-1,2560x1080@75,0x0,1

input {
  kb_layout = us, ru
  kb_variant =
  kb_model =
  kb_options = grp:win_space_toggle
  kb_rules =
  numlock_by_default = 1
  follow_mouse = 1
  sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
  accel_profile = adaptive
}

general {
  gaps_in = 2
  gaps_out = 1
  border_size = 2
  col.active_border = rgba(dcd7baee)
  col.inactive_border = rgba(727169ee)

  cursor_inactive_timeout = 15
}

decoration {
  rounding = 10
  blur = yes
  blur_size = 10
  blur_passes = 2
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

binds {
	scroll_event_delay = 0
}

misc {
	disable_hyprland_logo = true
	disable_splash_rendering = true
	vrr = 1
}

debug {
	overlay = false
}

windowrulev2 = float,class:(qalc)
windowrulev2 = size 300 500,class:(qalc)
windowrulev2 = move 1500 290,class:(qalc)

windowrulev2 = float,class:(floating)

bind = SUPER, Return, exec, footclient
bind = SUPER ALT, Return, exec, gtk-launch floating-terminal
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

# open floating calculator
bind = , XF86Calculator, exec, gtk-launch qalc

# control volume with kb keys
binde = , XF86AudioLowerVolume, exec, sh ~/.scripts/volume.sh --down
binde = , XF86AudioRaiseVolume, exec, sh ~/.scripts/volume.sh --up
bind = , XF86AudioMute, exec, sh ~/.scripts/volume.sh --mute

# control volume with additional mouse buttons
bind = SUPER ALT, mouse:275, exec, sh ~/.scripts/volume.sh --down
bind = SUPER ALT, mouse:276, exec, sh ~/.scripts/volume.sh --up

# control volume with scroll
bind = SUPER ALT, mouse_down, exec, sh ~/.scripts/volume.sh --up
bind = SUPER ALT, mouse_up, exec, sh ~/.scripts/volume.sh --down

# control player with kb keys
bind = , XF86AudioPlay, exec, playerctl play-pause
bind = , XF86AudioNext, exec, playerctl next
bind = , XF86AudioPrev, exec, playerctl previous

# control player with scroll
bind = SUPER SHIFT, mouse_down, exec, playerctl next
bind = SUPER SHIFT, mouse_up, exec, playerctl previous

    '';
  };
}

''
                env = XDG_SESSION_TYPE,wayland
                env = GDK_BACKEND,wayland,x11
                env = QT_QPA_PLATFORM,wayland;xcb
                env = SDL_VIDEODRIVER,wayland
                env = CLUTTER_BACKEND,wayland
                env = MOZ_ENABLE_WAYLAND,1
                env = _JAVA_OPTIONS,'-Dawt.useSystemAAFontSettings=on'
                env = _JAVA_AWT_WM_NONREPARENTING,1

                exec-once = waybar
                exec-once = nm-applet
                exec-once = blueman-applet
                exec-once = swww-daemon
                exec-once = hyprctl setcursor phinger-cursors-dark 24

                monitor = Unknown-1,disabled


                gestures {
                  workspace_swipe = true
                }

                dwindle {
      	        preserve_split = true
      		  }

                general {
                  gaps_in = 2
                  gaps_out = 1
                  border_size = 2
                  col.active_border = rgba(dcd7baee)
                  col.inactive_border = rgba(72716900)
                }

                binds {
                	scroll_event_delay = 10
                	allow_workspace_cycles = true
                	workspace_back_and_forth = true
                }

                opengl {
  				force_introspection = 0
  			  }

                misc {
                	disable_hyprland_logo = true
                	disable_splash_rendering = true
        		    disable_autoreload = true
        		    key_press_enables_dpms = true
        		    focus_on_activate = true
                }

                debug {
                	overlay = false
                	disable_logs = true
                }

                windowrulev2 = float,class:(qalc)
                windowrulev2 = size 300 500,class:(qalc)
                windowrulev2 = move 1200 290,class:(qalc)

                windowrulev2 = float,class:(floating)

                windowrulev2 = float,class:(.blueman-manager-wrapped)

                bind = SUPER, Return, exec, foot
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
                bind = SUPER, c, layoutmsg, togglesplit

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

                # lock screen
                bind = SUPER, L, exec, swaylock

                # open floating calculator
                bind = , XF86Calculator, exec, gtk-launch qalc
        	      bind = SUPER SHIFT, C, exec, gtk-launch qalc

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

                # screenshots
                bind = , Print, exec, sh ~/.scripts/screenshot.sh --area
                bind = SUPER, Print, exec, sh ~/.scripts/screenshot.sh --screen

                # power menu
                bind = SUPER, Escape, exec, rofi -show power-menu -modi "power-menu:rofi-power-menu --choices=suspend/reboot/shutdown"

        	      # brightness
        	      bind = , XF86MonBrightnessUp, exec, brightnessctl set +5%
        	      bind = , XF86MonBrightnessDown, exec, brightnessctl set 5%-


                bind = SUPER SHIFT ALT, P, submap, passthrough
                submap = passthrough
                bind = SUPER SHIFT ALT, Q, submap, reset
                submap = reset
''

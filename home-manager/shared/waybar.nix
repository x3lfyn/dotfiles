{ inputs, outputs, lib, config, pkgs, ... }: {
  programs.waybar = {
    enable = true;

    systemd.enable = false;

    package = pkgs.unstable.waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    });
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 27;
        spacing = 5;
        modules-left = [ "hyprland/workspaces" "cpu" "memory" "disk" ];
        modules-center = [ "hyprland/window" ];
        modules-right = [ "pulseaudio" "bluetooth" "hyprland/language" "clock" "tray" ];

        "hyprland/workspaces" = {
          #          on-click = "";
          #          sort-by-number = true;
          persistent_workspaces = {
            "*" = 10;
          };
          format-icons = {
            default = "■";
            active = "■";
          };
          format = "{icon}";
        };
        "cpu" = {
          format = " {usage}%";
          interval = 5;
        };
        "memory" = {
          format = " {}%";
          interval = 5;
        };
        "clock" = {
          format = "󰥔 {:%d.%m.%Y %H:%M}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          calendar = {
            mode = "year";
            mode-mon-col = 3;
            weeks-pos = "right";
            on-scroll = 1;
            on-click-right = "mode";
            format = {
              months = "<span color='#DCD7BA'><b>{}</b></span>";
              days = "<span color='#A3D4D5'><b>{}</b></span>";
              weeks = "<span color='#98BB6C'><b>W{}</b></span>";
              weekdays = "<span color='#957FB8'><b>{}</b></span>";
              today = "<span color='#FF5D62'><b><u>{}</u></b></span>";
            };
          };
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
            default = [ "󰕿" "󰖀" "󰕾" ];
          };
          on-click = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
          on-click-right = "pavucontrol";
        };
        "bluetooth" = {
          format-on = "󰂯";
          format-off = "󰂲";
          format-connected = "󰂱 {device_alias}";
          format-connected-battery = "󰥉 {device_alias} {device_battery_percentage}%";
          on-click = "rofi-bluetooth";
          tooltip-format = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
          tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
          tooltip-format-enumerate-connected-battery = "{device_alias}\t{device_address}\t{device_battery_percentage}%";
        };
        "disk" = {
          interval = 30;
          format = "󰋊 {percentage_used}%";
        };
        "battery" = {
          bat = "BAT0";
          states = {
            warning = "30";
            critical = "15";
          };
          format = "{icon} {capacity}%";
          format-charging = "󰂄 {capacity}%";
          format-icons = [ "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
        };

        "network" = {
          format = "󰛳 {ifname}";
          format-disconnected = "󰲛";
          format-wifi = "󰖩 {essid}";
          tooltip-format = "{ipaddr}/{cidr} on {ifname}";
          tooltip-format-wifi = "{essid}; Signal {signalStrength}%";
        };

        "backlight" = {
          format = "󰃟 {percent}%";
          device = "intel_backlight";
        };
      };
    };
  };
}

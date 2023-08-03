{ inputs, outputs, lib, config, pkgs, nix-colors, ... }: {
  programs.waybar = {
    enable = true;

    systemd.enable = false;

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
          on-click = "";
	  sort-by-number = true;
	  persistent_workspaces = {
            "1" = [];
	    "2" = [];
	    "3" = [];
	    "4" = [];
	    "5" = [];
	    "6" = [];
	    "7" = [];
	    "8" = [];
	    "9" = [];
	    "10" = [];
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

@define-color bg #16161D;
@define-color urgentBg #C34043;
@define-color fg #C8C093;
@define-color disabledFg #717C7C;
@define-color defaultFg #1F1F28;
@define-color selectedBg #2d4f67;
@define-color cpuBg #7e9cd8;
@define-color memBg #6a9589;
@define-color pulseBg #7aa89f;
@define-color bluetoothBg #7fb4ca;
@define-color langBg #938aa9;
@define-color clockBg #c0a36e;

/*@define-color bg #${config.colorScheme.colors.base01};
@define-color fg #${config.colorScheme.colors.base05};
@define-color defaultFg #${config.colorScheme.colors.base00};
@define-color selectedBg #${config.colorScheme.colors.base02};
@define-color cpuBg #${config.colorScheme.colors.base0F};
@define-color memBg #${config.colorScheme.colors.base0C};
@define-color pulseBg #${config.colorScheme.colors.base08};
@define-color bluetoothBg #${config.colorScheme.colors.base0D};
@define-color langBg #${config.colorScheme.colors.base06};
@define-color clockBg #${config.colorScheme.colors.base0A};*/

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
tooltip {
	color: @fg;
}
tooltip * {
	color: @fg;
}


#workspaces button {
	padding: 0px 3px;
	background-color: @bg;
	border-radius: 0px;
}

#workspaces button label {
	min-width: 16px;
	padding: 0px;
	margin: 5px 0px;
	border-radius: 8px;
	color: transparent;
	font-size: 8px;

	background: @disabledFg;
}

#workspaces button.active label {
	background: @fg;
	min-width: 26px;
}

#workspaces button.persistent label {
	background: @selectedBg;
}

#workspaces button.urgent label {
	background: @urgentBg;
}

#cpu, #memory, #language, #clock, #bluetooth, #pulseaudio {
	padding: 0 5px;
	margin: 0 2px;
}

#window {
	color: @fg;
	font-family: "Inter", sans-serif;
	font-size: 13px;
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
}
    '';
  };
}

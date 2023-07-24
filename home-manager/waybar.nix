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
          on-click = "activate";
	  sort-by-number = true;
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
background-color: @urgentBg;
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

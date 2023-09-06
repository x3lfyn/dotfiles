''
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
            @define-color diskBg #DCA561;
            @define-color batteryBg #938056;
            @define-color networkBg #98BB6C;
	    @define-color brightnessBg #FFA066;

            * {
            	font-family: "JetBrainsMono Nerd Font Propo", monospace;
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



            #workspaces button.persistent label {
            	background: @selectedBg;
            }

            #workspaces button.urgent label {
            	background: @urgentBg;
            }

            #cpu, #memory, #language, #clock, #bluetooth, #pulseaudio, #disk, #battery, #network, #backlight {
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
            #disk {
            	background-color: @diskBg;
            }
            #battery {
              background-color: @batteryBg;
            }
            #network {
      	background-color: @networkBg;
            }
	    #backlight {
		background-color: @brightnessBg;
	    }
    ''

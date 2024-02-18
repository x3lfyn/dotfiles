''
  @define-color bg #0A0E14;
  @define-color urgentBg #cc241d;
  @define-color fg #ebdbb2;
  @define-color disabledFg #a89984;
  @define-color defaultFg #00010A;
  @define-color selectedBg #273747;
  @define-color cpuBg #458588;
  @define-color memBg #427b58;
  @define-color pulseBg #626A73;
  @define-color bluetoothBg #6994BF;
  @define-color langBg #b16286;
  @define-color clockBg #FF8F40;
  @define-color diskBg #b57614;
  @define-color batteryBg #79740e;
  @define-color networkBg #076678;
  @define-color brightnessBg #fabd2f;
  @define-color playerBg #79740e;
  @define-color vpnBg #9d0006;

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
  #tray label {
    color: @fg;
  }
  tooltip {
    color: @fg;
  }
  tooltip * {
    color: @fg;
  }



  #workspaces button.empty label {
    background: @selectedBg;
  }

  #workspaces button.urgent label {
    background: @urgentBg;
  }

  #cpu, #memory, #language, #clock, #bluetooth, #pulseaudio, #disk, #battery, #network, #backlight,
  #mpris, #custom-vpn {
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
  #mpris {
    background-color: @playerBg;
  }
  #custom-vpn {
    background-color: @vpnBg;
  }
''

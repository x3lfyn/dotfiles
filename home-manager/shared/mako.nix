{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:
{
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
}

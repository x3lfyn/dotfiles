{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  nix-colors,
  ...
}:
{
  services.kdeconnect = {
    enable = true;
    indicator = true;
  };
}

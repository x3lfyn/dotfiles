{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  programs.ssh = {
    enable = true;

    serverAliveInterval = 15;
    serverAliveCountMax = 7;
    matchBlocks = {
      linie = {
        hostname = "srv.x3lfy.space";
        port = 7598;
        user = "confu";
        identityFile = "${config.home.homeDirectory}/.ssh/linie";
      };
      ubel = {
        hostname = "192.168.1.200";
        user = "pi";
        identityFile = "${config.home.homeDirectory}/.ssh/ubel";
      };
    };
  };
}

{ inputs, outputs, lib, config, pkgs, nix-colors, ... }: {
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
        hostname = "ubel.lan";
        user = "pi";
        identityFile = "${config.home.homeDirectory}/.ssh/ubel";
      };
    };
  };
}

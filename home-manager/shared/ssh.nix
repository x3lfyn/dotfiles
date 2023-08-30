{ inputs, outputs, lib, config, pkgs, nix-colors, ... }: {
  programs.ssh = {
    enable = true;
    matchBlocks = {
      curvy = {
        hostname = "srv.alterdojec.me";
        port = 7598;
        user = "confu";
        identityFile = "${config.home.homeDirectory}/.ssh/curvy-dock";
      };
      hs = {
        hostname = "server.home.lan";
        user = "confuser";
        identityFile = "${config.home.homeDirectory}/.ssh/homeserver";
      };
    };
  };
}

{ inputs, outputs, lib, config, pkgs, ... }: 
let
  spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
in
{
  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.Ziro;
    colorScheme = "orange-dark";

    spotifyPackage = pkgs.unstable.spotify;
    spicetifyPackage = pkgs.unstable.spicetify-cli;

    enabledExtensions = with spicePkgs.extensions; [
      hidePodcasts
      songStats
    ];
  };
}

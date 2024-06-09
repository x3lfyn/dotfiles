{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
let
  spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
in
{
  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.Default;
    colorScheme = "custom";
    customColorScheme = {
      text = "bfbdb6";
      subtext = "95e6cb";
      sidebar-text = "95e6cb";
      main = "0b0e14";
      sidebar = "11151c";
      player = "131721";
      card = "162025";
      shadow = "0A0E14";
      selected-row = "3a3e42";
      button = "95e6cb";
      button-active = "e6b450";
      button-disabled = "6c5980";
      tab-active = "131721";
      notification = "6c5980";
      notification-error = "6c5980";
      misc = "0f131a";
    };

    spotifyPackage = pkgs.spotify;
    spicetifyPackage = pkgs.unstable.spicetify-cli;

    enabledExtensions = with spicePkgs.extensions; [
      hidePodcasts
      songStats
      adblock
    ];
  };
}

{ inputs, outputs, lib, config, pkgs, ... }:
let
  spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
in
{
  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.Comfy;
    colorScheme = "custom";
    customColorScheme = {
      text = "ebdbb2";
      subtext = "B3B1AD";
      sidebar-text = "f2e5bc";
      main = "0A0E14";
      sidebar = "00010A";
      player = "00010A";
      card = "665c54";
      shadow = "0A0E14";
      selected-row = "3a3e42";
      button = "fabd2f";
      button-active = "504945";
      button-disabled = "3a3e42";
      tab-active = "7c6f64";
      notification = "223249";
      notification-error = "C34043";
      misc = "665c54";
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

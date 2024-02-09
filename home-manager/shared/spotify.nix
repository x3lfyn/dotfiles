{ inputs, outputs, lib, config, pkgs, ... }:
let
  spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
in
{
  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.Comfy;
    colorScheme = "Comfy";
    customColorScheme = {
      text = "DCD7BA";
      subtext = "C8C093";
      sidebar-text = "E6C384";
      main = "1F1F28";
      sidebar = "16161D";
      player = "2A2A37";
      card = "363646";
      shadow = "252535";
      selected-row = "49443C";
      button = "DCA561";
      button-active = "DCA561";
      button-disabled = "76946A";
      tab-active = "363646";
      notification = "223249";
      notification-error = "C34043";
      misc = "957FB8";
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

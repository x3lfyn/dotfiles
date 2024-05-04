# This file defines overlays
{ inputs, ... }:
{
  # This one brings our custom packages from the 'pkgs' directory
  additions = final: _prev: import ../pkgs { pkgs = final; };

  yukigram = final: prev: { yukigram = inputs.yukigram.packages.${final.system}.yukigram; };

  # This one contains whatever you want to overlay
  # You can change versions, add patches, set compilation flags, anything really.
  # https://nixos.wiki/wiki/Overlays
  modifications = final: prev: {
    jetbrains-toolbox = prev.jetbrains-toolbox.overrideAttrs (old: {
      nativeBuildInputs = old.nativeBuildInputs ++ [ final.makeWrapper ];
      postInstall = old.postInstall or "" + ''
        wrapProgram "$out/bin/jetbrains-toolbox" --set LD_LIBRARY_PATH ${final.libpng}/lib:${final.xorg.libxkbfile}/lib:${final.libbsd}/lib
      '';
    });

    google-chrome = prev.google-chrome.override {
      commandLineArgs = [
        "--enable-features=UseOzonePlatform"
        "--ozone-platform=wayland"
      ];
    };
  };

  # When applied, the unstable nixpkgs set (declared in the flake inputs) will
  # be accessible through 'pkgs.unstable'
  unstable-packages = final: _prev: {
    unstable = import inputs.nixpkgs-unstable {
      system = final.system;
      config.allowUnfree = true;
    };
  };
}

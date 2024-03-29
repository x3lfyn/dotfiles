# This file defines overlays
{ inputs, ... }:
{
  # This one brings our custom packages from the 'pkgs' directory
  additions = final: _prev: import ../pkgs { pkgs = final; };

  # This one contains whatever you want to overlay
  # You can change versions, add patches, set compilation flags, anything really.
  # https://nixos.wiki/wiki/Overlays
  modifications = final: prev: {
    # example = prev.example.overrideAttrs (oldAttrs: rec {
    # ...
    # });
    obsidian = prev.obsidian.overrideAttrs (oldAttrs: {
      postInstall = (oldAttrs.postInstall or "") + ''
                substituteInPlace $out/share/applications/obsidian.desktop\
        	  --replace "obsidian %u" "obsidian %u --ozone-platform-hint=auto"
      '';
    });
    spotify = prev.spotify.overrideAttrs (oldAttrs: {
      postInstall = (oldAttrs.postInstall or "") + ''
                substituteInPlace $out/share/applications/spotify.desktop\
        	  --replace "spotify %u" "spotify %u --enable-features=UseOzonePlatform --ozone-platform=wayland"
      '';
    });

    jetbrains-toolbox = prev.jetbrains-toolbox.overrideAttrs (old: {
      nativeBuildInputs = old.nativeBuildInputs ++ [ final.makeWrapper ];
      postInstall = old.postInstall or "" + ''
        wrapProgram "$out/bin/jetbrains-toolbox" --set LD_LIBRARY_PATH ${final.libpng}/lib:${final.xorg.libxkbfile}/lib:${final.libbsd}/lib
      '';
    });
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

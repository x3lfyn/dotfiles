{ inputs, ... }:
rec {
  additions = final: _prev: import ../pkgs { pkgs = final; };

  yukigram = final: prev: { yukigram = inputs.yukigram.packages.${final.system}.yukigram; };

  modifications = final: prev: {
    jetbrains-toolbox = prev.jetbrains-toolbox.overrideAttrs (old: {
      nativeBuildInputs = old.nativeBuildInputs ++ [ final.makeWrapper ];
      postInstall =
        old.postInstall or ""
        + ''
          wrapProgram "$out/bin/jetbrains-toolbox" --set LD_LIBRARY_PATH ${final.libpng}/lib:${final.xorg.libxkbfile}/lib:${final.libbsd}/lib
        '';
    });

    google-chrome = prev.google-chrome.override {
      commandLineArgs = [
        "--enable-features=UseOzonePlatform"
        "--ozone-platform=wayland"
      ];
    };

    libratbag = prev.libratbag.overrideAttrs (old: {
      patches = old.patches or [ ] ++ [ ./ratbag.patch ];
    });
  };

  unstable-packages = final: _prev: {
    unstable = import inputs.nixpkgs-unstable {
      system = final.system;
      config.allowUnfree = true;
    };
  };

  all = [
    additions
    yukigram
    modifications
    unstable-packages
  ];
}

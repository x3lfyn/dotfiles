# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example' or (legacy) 'nix-build -A example'

{ pkgs ? (import ../nixpkgs.nix) { } }: {
  # example = pkgs.callPackage ./example { };

  kanagawa-gtk-theme-lcl = pkgs.stdenv.mkDerivation rec {
            name = "kanagawa-gtk-theme-unstable-lcl";

            src = pkgs.fetchFromGitHub {
              owner = "Fausto-Korpsvart";
              repo = "Kanagawa-GKT-Theme";
              rev = "35936a1e3bbd329339991b29725fc1f67f192c1e";
              sha256 = "sha256-BZRmjVas8q6zsYbXFk4bCk5Ec/3liy9PQ8fqFGHAXe0=";
            };

            propagatedUserEnvPkgs = [ pkgs.gtk-engine-murrine ];

            dontBuild = true;

            installPhase = ''
                      runHook preInstall
                mkdir -p $out/share/themes
                cp -a themes/* $out/share/themes
                runHook postInstall;
            '';
          };
}

{
  description = "fucking fuck";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nurpkgs.url = "github:nix-community/NUR";

    nix-gaming.url = "github:fufexan/nix-gaming";

    yukigram = {
      url = "https://github.com/yukigram/yukigram";
      flake = true;
      type = "git";
      submodules = true;
    };

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/2.91.0.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
        url = "github:ryantm/agenix";
        inputs.nixpkgs.follows = "nixpkgs";
    };

    deploy-rs = {
        url = "github:serokell/deploy-rs";
        inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
        url = "github:nix-community/disko";
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    lix-module,
    deploy-rs,
    ...
  } @ inputs: let
    inherit (self) outputs;
    forAllSystems = nixpkgs.lib.genAttrs [
      "aarch64-linux"
      "i686-linux"
      "x86_64-linux"
      "aarch64-darwin"
      "x86_64-darwin"
    ];
    mkSystem = {
      system,
      modules ? [],
      specialArgs ? {},
    }: let
      totalSpecialArgs =
        {
          inherit inputs;
          overlays = outputs.overlays.all;
          myHmModules = outputs.homeManagerModules.all;
        }
        // specialArgs;
    in
      nixpkgs.lib.nixosSystem {
        inherit system;
        modules =
          [
            lix-module.nixosModules.default
            home-manager.nixosModules.home-manager
            {home-manager.extraSpecialArgs = totalSpecialArgs;}
          ]
          ++ modules;
        specialArgs = totalSpecialArgs;
      };
  in rec {
    packages = forAllSystems (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
      in
        import ./pkgs {inherit pkgs;}
    );

    devShells = forAllSystems (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
      in
        import ./shell.nix {inherit pkgs;}
    );

    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

    overlays = import ./overlays {inherit inputs;};
    nixosModules = import ./modules/nixos;
    homeManagerModules = import ./modules/home-manager;

    nixosConfigurations = {
      lawine = mkSystem {
        system = "x86_64-linux";
        modules = [./nixos/lawine/configuration.nix];
      };
      kanne = mkSystem {
        system = "x86_64-linux";
        modules = [./nixos/kanne/configuration.nix];
      };
      serie = mkSystem {
        system = "x86_64-linux";
        modules = [./nixos/serie/configuration.nix];
      };
    };
    deploy.nodes.serie = {
        hostname = "serie.x3lfy.space";
        profiles.system = {
            sshUser = "confu";
            user = "root";
            path = deploy-rs.lib.x86_64-linux.activate.nixos self.nixosConfigurations.serie;
            sshOpts = [
                "-i"
                "/home/vobbla16/.ssh/serie"
            ];
        };
    };
  };
}

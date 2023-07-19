{ inputs, outputs, lib, config, pkgs, nix-colors, ... }: {
	services.syncthing = {
		enable = true;

		tray = {
			enable = false;
			command = "syncthingtray --wait";
			package = pkgs.syncthingtray;
		};
	};
}

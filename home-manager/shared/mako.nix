{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  services.mako = {
    enable = true;
    settings = {
		anchor = "top-center";
		font = "Inter 12";
		background-color = "#1f1f28";
		text-color = "#dcd7ba";
		progress-color = "#43242B";
		border-size = 2;
		border-radius = 10;
		padding = "8";
		icon-path = "${config.home.homeDirectory}/.nix-profile/share/icons/Papirus-Dark";
		layer = "overlay";
		default-timeout = 3000;
	};
  };
}

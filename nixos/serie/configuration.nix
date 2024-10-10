{
  modulesPath,
  config,
  pkgs,
  inputs,
  ...
}:
let
    secrets = pkgs.callPackage ../../utils/insecureSecret.nix {};
in
{
  imports = [
    (modulesPath + "/profiles/qemu-guest.nix")
    inputs.disko.nixosModules.disko
    inputs.agenix.nixosModules.default
    ./openvpn.nix
    ./disk-config.nix
  ];

  age.identityPaths = [ "/etc/agenix/agenix" ];

  services.prometheus = {
	enable = true;
	globalConfig.scrape_interval = "10s";
	scrapeConfigs = [
		{
			job_name = "serie";
			static_configs = [{
				targets = [ "localhost:${toString config.services.prometheus.exporters.node.port}" ];
			}];
		}
		{
			job_name = "linie";
			static_configs = [{
				targets = [ "10.7.7.20:9100" ];
			}];
		}
		{
			job_name = "traefik_metrics";
			static_configs = [{
				targets = [ "10.7.7.20:12341" ];
			}];
			basic_auth = {
				username = secrets.getInsecure "linie-traefik-metrics-user";
				password = secrets.getInsecure "linie-traefik-metrics-passwd";
			};
		}
		{
			job_name = "wg_metrics";
			static_configs = [{
				targets = [ "10.7.7.20:41568" ];
			}];
			basic_auth = {
				username = secrets.getInsecure "linie-wg-metrics-user";
				password = secrets.getInsecure "linie-wg-metrics-passwd";
			};
		}
		{
			job_name = "bb_http";
			metrics_path = "/probe";
			params.module = [ "http_2xx" "https_2xx" ];
			relabel_configs = [
				{
					source_labels = [ "__address__" ];
					target_label = "__param_target";
				}
				{
					source_labels = [ "__param_target" ];
					target_label = "instance";
				}
				{
					replacement = "localhost:31416";
					target_label = "__address__";
				}
			];
			static_configs = [{
				targets = [ "misskey.x3lfy.space" "wgpanel.x3lfy.space" "atuin.x3lfy.space" "vaultwarden-w5ktc9rr.x3lfy.space" "umami.x3lfy.space" "meow.x3lfy.space" "meows.x3lfy.space" "immich.x3lfy.space" ];
			}];
		}
		{
			job_name = "bb_ping";
			metrics_path = "/probe";
			params.module = [ "icmp" ];
			relabel_configs = [
				{
					source_labels = [ "__address__" ];
					target_label = "__param_target";
				}
				{
					source_labels = [ "__param_target" ];
					target_label = "instance";
				}
				{
					replacement = "localhost:31416";
					target_label = "__address__";
				}
			];
			static_configs = [{
				targets = [ "linie.x3lfy.space" "fern.x3lfy.space" ];
			}];
		}
	];
	exporters.node = {
		enable = true;
		port = 34215;
		extraFlags = [ "--collector.ethtool" "--collector.tcpstat" ];
	};
	exporters.blackbox = {
		enable = true;
		port = 31416;
		configFile = ./blackbox.yaml;
	};
  };

	services.grafana = {
		enable = true;
		settings.server = {
			http_port = 14561;
			http_addr = "0.0.0.0";
		};
		provision.datasources.settings = {
			apiVersion = 1;
			datasources = [
			{
				name = "prometheus";
				type = "prometheus";
				url = "http://localhost:9090";
			}
			{
				name = "loki";
				type = "loki";
				url = "http://localhost:3100";
			}
			];
		};
	};

  boot.initrd.availableKernelModules = [
    "ata_piix"
    "uhci_hcd"
    "virtio_pci"
    "sr_mod"
    "virtio_blk"
  ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  boot.loader.grub = {
    efiSupport = true;
    efiInstallAsRemovable = true;
  };
  services.openssh.enable = true;
  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    curl
    git
  ];

  security.sudo.wheelNeedsPassword = false;

  users.users.confu = {
    openssh.authorizedKeys.keys = [
      (builtins.readFile ../../ssh/serie.pub)
    ];
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
    shell = pkgs.zsh;
  };

  nix.settings.trusted-users = [
    "root"
    "@wheel"
  ];
  networking = {
    hostName = "serie";
    networkmanager.enable = true;
    interfaces.ens3 = {
      useDHCP = false;
      ipv4.addresses = [
        {
          address = secrets.getInsecure "serie-ip";
          prefixLength = 24;
        }
      ];
    };
    defaultGateway = secrets.getInsecure "serie-gw";
    nameservers = [
      "1.1.1.1"
      "8.8.8.8"
    ];

    firewall = {
      enable = true;
      allowedTCPPorts = [ 22 14561 7835 ];
      allowedUDPPorts = [ 13872 ];
    };
  };
  time.timeZone = "Europe/Moscow";

  system.stateVersion = "24.05";
}

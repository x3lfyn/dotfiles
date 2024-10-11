{
  modulesPath,
  pkgs,
  inputs,
  ...
}: let
  secrets = pkgs.callPackage ../../utils/insecureSecret.nix {};
in {
  imports = [
    (modulesPath + "/profiles/qemu-guest.nix")
    inputs.disko.nixosModules.disko
    inputs.agenix.nixosModules.default
    ./openvpn.nix
    ./disk-config.nix
    ./monitoring.nix
    ./revproxy.nix
  ];

  age.identityPaths = ["/etc/agenix/agenix"];

  virtualisation.docker.enable = true;
  virtualisation.oci-containers.backend = "docker";

  boot.initrd.availableKernelModules = [
    "ata_piix"
    "uhci_hcd"
    "virtio_pci"
    "sr_mod"
    "virtio_blk"
  ];
  boot.initrd.kernelModules = [];
  boot.kernelModules = [];
  boot.extraModulePackages = [];

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
      allowedTCPPorts = [22 80 443];
      allowedUDPPorts = [13872];
    };
  };
  time.timeZone = "Europe/Moscow";

  system.stateVersion = "24.05";
}

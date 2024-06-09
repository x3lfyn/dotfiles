{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}:

{
  boot.initrd.availableKernelModules = [
    "nvme"
    "xhci_pci"
    "ahci"
    "usb_storage"
    "usbhid"
    "sd_mod"
  ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/ff7279c8-6f4e-4020-af91-53a0bce33b4a";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/6E00-AB44";
    fsType = "vfat";
  };

  fileSystems."/hdd" = {
    device = "/dev/disk/by-uuid/808e61e4-069a-4728-96da-d198290c0fad";
    fsType = "btrfs";
    options = [ "subvol=@data" ];
  };

  fileSystems."/iso" = {
    device = "/dev/disk/by-uuid/808e61e4-069a-4728-96da-d198290c0fad";
    fsType = "btrfs";
    options = [ "subvol=@iso" ];
  };

  swapDevices = [ ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  #  networking.useDHCP = true;
  # networking.interfaces.enp5s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = config.hardware.enableRedistributableFirmware;
}

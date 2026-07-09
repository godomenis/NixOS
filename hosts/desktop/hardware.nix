{ config, lib, pkgs, modulesPath, ... }:
{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "usb_storage" "sd_mod" "rtsx_usb_sdmmc" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = { 
    device = "/dev/disk/by-uuid/6121d96f-8c11-45a5-be90-d70a323a72ab";
    fsType = "btrfs";
  };
  fileSystems."/home" = { 
    device = "/dev/disk/by-uuid/6121d96f-8c11-45a5-be90-d70a323a72ab";
    fsType = "btrfs";
    options = [ "subvol=home" ];
  };
  fileSystems."/nix" = { 
    device = "/dev/disk/by-uuid/6121d96f-8c11-45a5-be90-d70a323a72ab";
    fsType = "btrfs";
    options = [ "subvol=nix" ];
  };
  fileSystems."/boot" = { 
    device = "/dev/disk/by-uuid/C00E-B6C0";
    fsType = "vfat";
    options = [ "fmask=0077" "dmask=0077" ];
  };

  swapDevices = [ ];
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}

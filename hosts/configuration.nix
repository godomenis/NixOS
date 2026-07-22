{
  imports = [
    ./hardware.nix
    ../modules/system/core.nix
    ../modules/system/drivers.nix
    ../modules/services/desktop.nix
    ../modules/services/gaming.nix
    ../modules/services/virtualization.nix
  ];

  networking.hostName = "nixos";
  system.stateVersion = "26.05";
}

{ pkgs, ... }:
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 10;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_zen;

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;
    max-jobs = "auto";
    substituters = [ "https://cache.nixos.org" "https://noctalia.cachix.org" ];
    trusted-public-keys = [ "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=" "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4=" ];
  };

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [
      "pnpm-10.29.2"
  ];

  networking.networkmanager.enable = true;
  time.timeZone = "America/Ciudad_Juarez";
  i18n.defaultLocale = "es_MX.UTF-8";
  services.xserver.xkb = { layout = "latam"; variant = ""; };
  console.keyMap = "la-latin1";

  programs.zsh.enable = true;

  users.users.godo = {
    isNormalUser = true;
    description = "Godo Menis";
    extraGroups = [ "networkmanager" "wheel" "storage" "video" "audio" "docker" ];
    shell = pkgs.zsh;
  };

  zramSwap = {
    enable = true;
    memoryPercent = 100;
    algorithm = "zstd";
  };

  fonts = {
      enableDefaultPackages = true;
      fontDir.enable = true;
      packages = with pkgs; [
        corefonts
        nerd-fonts.jetbrains-mono
        vista-fonts
        liberation_ttf
      ];
      fontconfig = {
        enable = true;
        defaultFonts = {
          serif = [ "Times New Roman" ];
          sansSerif = [ "Arial" ];
          monospace = [ "JetBrainsMono Nerd Font" ];
        };
      };
    };

  nix.gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
  };

  environment.systemPackages = with pkgs; [ 
  wget 
  git 
  micro 
  tree 
  unzip 
  ripgrep ];
}

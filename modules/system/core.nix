{ pkgs, ... }:
{
  boot.loader = {
    timeout = 8;
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
      configurationLimit = 15;
      theme = ../../yorha-grub-theme/yorha-2560x1440;
    };
  };

  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.kernelParams = [ "amd_pstate=active" ];

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;
    max-jobs = "auto";
    substituters = [ "https://cache.nixos.org" "https://noctalia.cachix.org" ];
    trusted-public-keys = [ "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=" "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4=" ];
  };

  nixpkgs.config.allowUnfree = true;
  
  services.logind.settings.Login.HandleLidSwitch = "ignore";
  services.logind.settings.Login.HandleLidSwitchExternalPower = "ignore";

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

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 7d";
    flake = "/home/godo/NixOS#desktop";
  };

  zramSwap = {
    enable = true;
    memoryPercent = 100;
    algorithm = "zstd";
  };

  services.fstrim.enable = true;
  services.btrfs.autoScrub = {
    enable = true;
    interval = "monthly";
    fileSystems = [ "/" ];
  };

  services.snapper.configs = {
    home = {
      SUBVOLUME = "/home";
      ALLOW_USERS = [ "godo" ];
      TIMELINE_CREATE = true;
      TIMELINE_CLEANUP = true;
    };
  };

  fonts = {
      enableDefaultPackages = true;
      fontDir.enable = true;
      packages = with pkgs; [
        corefonts
        vista-fonts
        liberation_ttf
  
        comfortaa
        quicksand
        nunito
        inter
        roboto
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-color-emoji
  
        nerd-fonts.jetbrains-mono
        nerd-fonts.fira-code
      ];
      
      fontconfig = {
        enable = true;
        defaultFonts = {
          sansSerif = [ "Comfortaa" "Quicksand" "Inter" "Arial" ];
          serif = [ "Noto Serif" "Times New Roman" ];
          monospace = [ "JetBrainsMono Nerd Font" ];
          emoji = [ "Noto Color Emoji" ];
        };
      };
    };

  environment.systemPackages = with pkgs; [
    wget
    git
    micro
    tree
    unzip
    glib
    ripgrep
  ];
}


{
  imports = [
    ./packages.nix
    ./programs/firefox.nix
    ./programs/alacritty.nix
    ./programs/zsh.nix
    ./programs/mangohud.nix
    ./programs/fastfetch.nix
    ./programs/noctalia.nix
    ./niri/niri.nix
  ];

  home.username = "godo";
  home.homeDirectory = "/home/godo";
  home.stateVersion = "26.05";
  programs.home-manager.enable = true;
}

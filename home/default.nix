{
  imports = [
    ./apps.nix
    ./firefox.nix
    ./foot.nix
    ./zsh.nix
    ./fastfetch.nix
    ./niri/niri.nix
    ./noctalia/noctalia.nix
  ];

  home.username = "godo";
  home.homeDirectory = "/home/godo";
  home.stateVersion = "26.05";
  programs.home-manager.enable = true;
}

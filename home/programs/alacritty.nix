{ pkgs, ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        size = 13;
        normal = {
          family = "JetBrainsMono Nerd Font";
          style = "Regular";
        };
      };
      window = {
        padding = {
          x = 10;
          y = 10;
        };
        opacity = 0.9;
      };
    };
  };
}

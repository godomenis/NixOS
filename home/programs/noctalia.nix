{ inputs, pkgs, ... }:
{
  imports = [ inputs.noctalia.homeModules.default ];

  programs.noctalia = {
    enable = true;
    systemd.enable = true;
    settings = {
      shell.polkit_agent = true;
      theme = {
        mode = "dark";
        source = "builtin";
        builtin = "Noctalia";
      };
      wallpaper.enabled = true;
      backdrop.enabled = false; 
    };
  };
}

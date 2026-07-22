{ config, pkgs, ... }:
{
  programs.foot = {
    enable = true;
    settings = {
      main = { 
        font = "JetBrainsMono Nerd Font:size=12";
      };
      
      keybindings = {
        select-all = "Control+Shift+a";
      };
    };
  };

  xdg.configFile."foot/foot.ini".force = true;
}

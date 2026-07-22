{ config, pkgs, ... }:
{
  programs.mangohud = {
    enable = true;
    settings = {
      horizontal = true;
      position = "top-center"; 
      
      font_size = 22;
      background_alpha = "0.2";
      hud_no_margin = true;   
      
      fps = true;
      gpu_stats = true;
      cpu_stats = true;
      ram = true;
      
      frametime = false;
      gpu_temp = false;
      cpu_temp = false;
      core_load = false;
    };
  };
}

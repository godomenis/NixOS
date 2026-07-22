{ pkgs, inputs, ... }:
{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;    
    gamescopeSession.enable = true;
    extraCompatPackages = with pkgs; [ proton-ge-bin ];
  };
  
  programs.gamescope.enable = true;
  programs.gamescope.capSysNice = true;

  programs.gamemode = {
    enable = true;
    enableRenice = true;
    settings = {
      general = { softrealtime = "auto"; renice = 10; };
      gpu = { apply_gpu_optimisations = "accept-responsibility"; amd_performance_level = "high"; };
    };
  };

  hardware.xone.enable = true;

  environment.sessionVariables = {
    MESA_SHADER_CACHE_MAX_SIZE = "12G";
  };

}

{ pkgs, ... }:
{
  virtualisation = {
    docker = {
      enable = true;
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };
    
    waydroid.enable = true;
  };

  networking.firewall.trustedInterfaces = [ "waydroid0" ];
}

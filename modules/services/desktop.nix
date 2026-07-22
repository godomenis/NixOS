{ pkgs, ... }:
{
  services.xserver.enable = true;
  services.xserver.desktopManager.xterm.enable = false;
  services.xserver.excludePackages = [ pkgs.xterm ];

  services.displayManager.sddm = {
    enable = true;
    settings = {
      General = {
        InputMethod = "";
        Numlock = "on";
      };
    };
  };

  programs.qylock = {
    enable = true;
    theme = "enfield";
  };

  programs.niri.enable = true;
  services.flatpak.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;

  programs.gpu-screen-recorder.enable = true;

  programs.thunar.enable = true;
  programs.thunar.plugins = with pkgs; [ thunar-archive-plugin thunar-volman ];

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-wlr pkgs.xdg-desktop-portal-gtk ];
    config.common.default = "*";
  };
}

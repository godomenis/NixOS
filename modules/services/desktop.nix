{ pkgs, inputs, ... }:
{
  programs.noctalia-greeter = {
    enable = true;
    package = inputs.noctalia-greeter.packages.${pkgs.stdenv.hostPlatform.system}.default;
    greeter-args = "--user godo --session niri";
    settings = {
      cursor = { theme = "Adwaita"; size = 24; };
      keyboard = { layout = "latam"; options = "numlock:on"; };
      output = { scale = 1.67; };
    };
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

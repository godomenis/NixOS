{ pkgs, ... }:
{
  home.packages = with pkgs; [
    vesktop
    teams-for-linux
    deezer-desktop
    mpv
    mpvpaper
    obs-studio
    onlyoffice-desktopeditors
    (zathura.override { 
      plugins = [ zathuraPkgs.zathura_pdf_mupdf zathuraPkgs.zathura_cb zathuraPkgs.zathura_djvu ]; 
    })
    yazi
    fastfetch
    eza
    file-roller
    joplin-desktop
    bat
    btop
    fzf
    xwayland-satellite
    mangohud
    steam-run
    protonup-qt
    glib
    adwaita-icon-theme
    gnome-themes-extra
  ];

  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
    GTK_USE_PORTAL = "1";
    LIBVA_DRIVER_NAME = "radeonsi";
    PDF_VIEWER = "zathura";
    READER = "zathura";
    GTK_THEME = "Adwaita:dark"; 
    QT_STYLE_OVERRIDE = "Adwaita-Dark";
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      gtk-theme = "Adwaita-dark"; 
      color-scheme = "prefer-dark";
    };
  };
}

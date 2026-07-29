{ pkgs, ... }:
{
  home.packages = with pkgs; [
    vesktop
    teams-for-linux
    mpv
    mpvpaper
    onlyoffice-desktopeditors
    fastfetch
    eza
    file-roller
    bat
    bottom
    wl-clipboard
    pavucontrol
    guvcview
    gh
    easyeffects
    resources
    nix-output-monitor
    baobab
    kdePackages.okular
    mousepad
    alacritty
    alejandra
    qalculate-gtk
    loupe
    wdisplays
    catppuccin-cursors.frappeLight
    xwayland-satellite
    steam-run
    protonup-qt
    adwaita-icon-theme
    gnome-themes-extra
  ];

  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
    GTK_USE_PORTAL = "1";
    LIBVA_DRIVER_NAME = "radeonsi";
    GTK_THEME = "Adwaita-dark";
    QT_STYLE_OVERRIDE = "Adwaita-Dark";
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      gtk-theme = "Adwaita-dark";
      color-scheme = "prefer-dark";
    };
  };
}

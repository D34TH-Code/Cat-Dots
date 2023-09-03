{ inputs, pkgs, ... }: {
  home.pointerCursor = {
    name = "Catppuccin-Cursor";
    package = pkgs.catppuccin-cursors.mochaDark;
    size = 32;
    gtk.enable = true;
    x11.enable = true;
  };

  fonts.fontconfig.enable = true;

  gtk = {
    enable = true;
    font = {
      name = "Roboto";
      package = pkgs.roboto;
      size = 12;
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
      gtk-decoration-layout = "menu:";
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
      gtk-decoration-layout = "menu:";
    };
  };

  qt = {
    enable = true;
    platformTheme = "gnome";
    style = {
      name = "adwaita-dark";
      package = pkgs.adwaita-qt;
    };
  };
}
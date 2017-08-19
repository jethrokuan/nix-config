{ config, pkgs, ... }:

let
  iconTheme = pkgs.breeze-icons.out;
  themeEnv = ''
    # QT: remove local user overrides (for determinism, causes hard to find bugs)
    rm -f ~/.config/Trolltech.conf
    # GTK3: remove local user overrides (for determinisim, causes hard to find bugs)
    rm -f ~/.config/gtk-3.0/settings.ini
    # GTK3: add breeze theme to search path for themes
    # (currently, we need to use gnome-breeze because the GTK3 version of kde5.breeze is broken)
    export XDG_DATA_DIRS="${pkgs.gnome-breeze}/share:$XDG_DATA_DIRS"
    # GTK3: add /etc/xdg/gtk-3.0 to search path for settings.ini
    # We use /etc/xdg/gtk-3.0/settings.ini to set the icon and theme name for GTK 3
    export XDG_CONFIG_DIRS="/etc/xdg:$XDG_CONFIG_DIRS"
    # GTK2 theme + icon theme
    export GTK2_RC_FILES=${pkgs.writeText "iconrc" ''gtk-icon-theme-name="breeze"''}:${pkgs.breeze-gtk}/share/themes/Breeze/gtk-2.0/gtkrc:$GTK2_RC_FILES
    # SVG loader for pixbuf (needed for GTK svg icon themes)
    export GDK_PIXBUF_MODULE_FILE=$(echo ${pkgs.librsvg.out}/lib/gdk-pixbuf-2.0/*/loaders.cache)
  '';
  stumpwm = pkgs.lib.overrideDerivation pkgs.stumpwm(x: {
    nativeBuildInputs = x.nativeBuildInputs ++ [
      pkgs.stumpwm.lispPackages.clx-truetype
    ];
    installPhase = (x.installPhase or "") + ''
      echo "$nativeBulidInputs" > "$out/nix-support/build-inputs"
    '';
  });
in {

  # Stumpwm
  environment.systemPackages = with pkgs; [
    xlibs.xrdb
    nitrogen
    stumpwm
    lispPackages.quicklisp
    dunst
    dropbox

    breeze-qt5
    breeze-qt4

    iconTheme
    gnome3.adwaita-icon-theme
    hicolor_icon_theme
    gnome3.gvfs
  ];

  services.xserver.desktopManager.xterm.enable = false;
  services.xserver.windowManager.stumpwm.enable = true;

  services.gnome3.gvfs.enable = true;

  services.compton = {
    enable = true;
    inactiveOpacity = "0.8";
    shadow = false;
    extraOptions = ''
      blur-background = true;
      blur-background-frame = true;
      blur-kern = "7x7box";
    '';
  };

  systemd.user.services."dunst" = {
    enable = true;
    description = "";
    wantedBy = [ "default.target" ];
    serviceConfig.Restart = "always";
    serviceConfig.RestartSec = 2;
    serviceConfig.ExecStart = "${pkgs.dunst}/bin/dunst";
  };

  services.xserver.displayManager.sessionCommands = ''
    ${pkgs.xlibs.xrdb}/bin/xrdb -load $HOME/.XResources &
    ${pkgs.nitrogen}/bin/nitrogen --restore &
    ${pkgs.rxvt_unicode}/bin/urxvtd &
    ${pkgs.dropbox}/bin/dropbox start &
  '';

  environment.extraInit = ''
    ${themeEnv}
    # these are the defaults, but some applications are buggy so we set them
    # here anyway
    export XDG_CONFIG_HOME=$HOME/.config
    export XDG_DATA_HOME=$HOME/.local/share
    export XDG_CACHE_HOME=$HOME/.cache
  '';

  environment.etc."xdg/gtk-3.0/settings.ini" = {
    text = ''
      [Settings]
      gtk-icon-theme-name=breeze
      gtk-theme-name=Breeze-gtk
    '';
    mode = "444";
  };
}

{ config, pkgs, ... }:

{
  # Stumpwm
  services.xserver.windowManager.stumpwm.enable = true;
  services.xserver.desktopManager.gnome3.enable =true;
  # services.xserver.desktopManager.xterm.enable = false;

  services.compton = {
    enable = true;
    shadow = false;
    extraOptions = ''
      blur-background = true;
      blur-background-frame = true;
      blur-kern = "7x7box";
    '';
  };
}

{ config, pkgs, ... }:

{
  services.xserver.enable = true;
  services.xserver.libinput.enable = true;
  services.xserver.layout = "us";
  services.xserver.xkbVariant = "dvorak";

  # Stumpwm
  environment.systemPackages = with pkgs; [
    stumpwm
    lispPackages.quicklisp
    dunst
    compton
  ];

  services.xserver.desktopManager.xterm.enable = false;
  services.xserver.desktopManager.xfce.enable = false;
  services.xserver.windowManager.stumpwm.enable = true;

  # EXWM
  # services.xserver = {
  #   desktopManager.xfce.enable = true;
  #   displayManager.lightdm.enable = true;
  #   enable = true;
  #   windowManager.exwm = {
  #     enable = true;
  #     enableDefaultConfig = false;
  #   };    
  # };

  #XFCE
    # environment.systemPackages = with pkgs; [
  #    adapta-gtk-theme
  #    xfce.exo
  #    xfce.gtk_xfce_engine
  #    xfce.libxfce4ui
  #    xfce.libxfcegui4
  #    xfce.xfce4_battery_plugin
  #    xfce.xfwm4
  #    xfce.xfwm4themes
  #    xfce.thunar
  #    xfce.xfce4settings
  #    xfce.xfconf
  #    xfce.gvfs
  # ];

  # Enable the XFCE Desktop environment
  # services.xserver.desktopManager.xfce.enable = true;
  #Thunar Volume Support
  # services.udisks2.enable = true;  
}

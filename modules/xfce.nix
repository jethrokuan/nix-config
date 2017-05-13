{ config, pkgs, ... }:

{
  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.libinput.enable = true;
  services.xserver.layout = "us";
  services.xserver.xkbVariant = "dvorak";
  
  environment.systemPackages = with pkgs; [
     adapta-gtk-theme
     xfce.exo
     xfce.gtk_xfce_engine
     xfce.libxfce4ui
     xfce.libxfcegui4
     xfce.xfce4_battery_plugin
     xfce.xfwm4
     xfce.xfwm4themes
     xfce.thunar
     xfce.xfce4settings
     xfce.xfconf
     xfce.gvfs
  ];

  # Enable the XFCE Desktop environment
  services.xserver.desktopManager.xfce.enable = true;
  #Thunar Volume Support
  services.udisks2.enable = true;
}

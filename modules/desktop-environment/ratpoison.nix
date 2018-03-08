{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nitrogen
  ];

  services.xserver.desktopManager.gnome3.enable =true;
  services.xserver.windowManager.ratpoison.enable = true;

  services.xserver.desktopManager.default = "gnome3";
  services.xserver.windowManager.default = "ratpoison";
}

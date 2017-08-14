{ config, pkgs, ... }:
{
  services.xserver.enable = true;
  services.xserver.libinput.enable = true;
  services.xserver.layout = "us";
  services.xserver.xkbVariant = "dvorak";
  services.xserver.xkbOptions = "ctrl:nocaps";

  services.xserver.desktopManager.xfce.enable = true;
}

{ config, pkgs, ... }:
let
  myPackages = (import ../emacs-packages.nix);
in
{
  services.xserver.windowManager.exwm.enable = true;
  services.xserver.windowManager.exwm.extraPackages = myPackages;
}

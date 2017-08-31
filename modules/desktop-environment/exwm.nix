{ config, pkgs, ... }:
let
  inherit (import ../emacs-packages.nix {inherit pkgs;}) myPackages;
in
{
  services.xserver.windowManager.exwm.enable = true;
  services.xserver.windowManager.exwm.extraPackages = myPackages;
}

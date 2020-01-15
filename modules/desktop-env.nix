{ config, pkgs, ... }:

{
  services.xserver.windowManager.exwm.enable = true;
  environment.systemPackages = with pkgs; [
    numix-cursor-theme
  ];
}

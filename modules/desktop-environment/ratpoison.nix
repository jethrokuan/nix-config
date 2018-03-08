{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nitrogen
    wmname
  ];

  services.xserver.windowManager.ratpoison.enable = true;

  services.xserver.windowManager.default = "ratpoison";
}

{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    firefox
    xfce.thunar
  ];

  nixpkgs.config.firefox = {
    enableGoogleTalkPlugin = true;
    enableAdobeFlash = true;
  };

  environment.variables.BROWSER = pkgs.lib.mkOverride 0 "firefox";
}

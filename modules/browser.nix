{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    firefox
    conkeror

    xfce.thunar
  ];

  nixpkgs.config.firefox.enableAdobeFlash = true;
  nixpkgs.config.firefox.enableGoogleTalkPlugin = true;

  environment.variables.BROWSER = pkgs.lib.mkOverride 0 "firefox";
}

{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    firefox
    conkeror
  ];

  nixpkgs.config.firefox.enableAdobeFlash = true;
  nixpkgs.config.firefox.enableGoogleTalkPlugin = true;

  environment.variables.BROWSER = pkgs.lib.mkOverride 0 "firefox";
}

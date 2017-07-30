{ config, pkgs, ... }:
{
  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      corefonts
      iosevka
      source-code-pro
      source-sans-pro
      source-serif-pro
      nerdfonts
    ];

    fontconfig = {
      enable = true;
      defaultFonts = {
       monospace = [ "Source Code Pro" ];
       sansSerif = [ "Source Sans Pro" ];
       serif = [ "Source Serif Pro" ];
      };
    };
  };
}

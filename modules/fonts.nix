{ config, pkgs, ... }:
{
  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      corefonts
      font-droid
      iosevka
      fira-code
      source-code-pro
      source-sans-pro
      source-serif-pro
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

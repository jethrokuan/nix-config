{ config, pkgs, ... }:
{
  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      iosevka
      libre-baskerville
      emacs-all-the-icons-fonts
      source-code-pro
      source-sans-pro
      source-serif-pro
      etBook
      ia-writer-duospace
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

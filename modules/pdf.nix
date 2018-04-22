{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    texlive.combined.scheme-full
    zathura
    ghostscript
    python27Packages.pygments
  ];
}

{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    zathura
    ghostscript
  ];
}

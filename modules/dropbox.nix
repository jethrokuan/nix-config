{ config, pkgs, ...}:
{
  environment.systemPackages = [
    pkgs.dropbox-cli
    pkgs.dropbox
  ];
}

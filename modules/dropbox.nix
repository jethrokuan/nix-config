{ config, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    dropbox-cli
  ];
}

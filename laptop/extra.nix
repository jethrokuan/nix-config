{config, pkgs, ... }:
{
  boot.kernelModules = [ "fuse" ];
  networking.hostName = "jethro-laptop"; # Define your hostname.

  imports = [
    ../modules/desktop-environment/xfce.nix
  ];
}

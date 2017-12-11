{config, pkgs, ... }:
{
  services.xserver.videoDrivers = [ "nvidia" ];
  boot.kernelModules = [ "fuse" ];
  networking.hostName = "jethro-laptop"; # Define your hostname.
}

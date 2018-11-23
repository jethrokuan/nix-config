{config, pkgs, ... }:
{
  boot.kernelModules = [ "fuse" ];
  networking.hostName = "jethro-laptop";

  services.upower.enable = true;
}

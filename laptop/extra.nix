{config, pkgs, ... }:
{
  boot.kernelModules = [ "fuse" ];
  networking.hostName = "jethro-laptop";

  boot.kernelPackages = pkgs.linuxPackages_4_14;

  services.upower.enable = true;
}

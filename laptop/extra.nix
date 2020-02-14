{config, pkgs, ... }:
{
  boot.kernelModules = [ "fuse" ];
  networking.hostName = "jethro-laptop";

  boot.kernelPackages = pkgs.linuxPackages_latest;

  services.upower.enable = true;

  hardware.brightnessctl.enable = true;
  # hardware.bluetooth.enable = true;
  # services.blueman.enable = true;
}

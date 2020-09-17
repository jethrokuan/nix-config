{config, pkgs, ... }:
{
  boot.kernelModules = [ "fuse" ];
  networking.hostName = "jethro-laptop";

  boot.kernelPackages = pkgs.linuxPackages_latest;

  services.upower.enable = true;

  environment.systemPackages = with pkgs; [
    brightnessctl
  ];
  hardware.bluetooth.enable = true;
}

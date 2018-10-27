{ config, pkgs, ... }:
{
  imports = [
    ../modules/wine.nix
    # ../modules/steam.nix
  ];

  # Setup to support wireless driver
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelModules = [ "fuse" "kvm-intel" ];

  hardware.pulseaudio.enable = true;

  networking.hostName = "jethro-desktop"; # Define your hostname.

  services.xserver.videoDrivers = [ "nvidia" ];
}

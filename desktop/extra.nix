{ config, pkgs, ... }:
{
  imports = [
    # Compositor
    ../modules/wine.nix
  ];

  # Setup to support wireless driver
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelModules = [ "fuse" "kvm-intel" ];

  hardware.pulseaudio.enable = true;

  networking.hostName = "jethro-desktop"; # Define your hostname.

  services.xserver.videoDrivers = [ "nvidia" ];
}

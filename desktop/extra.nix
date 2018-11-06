{ config, pkgs, ... }:
{
  imports = [
    ../modules/wine.nix
    # ../modules/steam.nix
  ];

  # Setup to support wireless driver
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelModules = [ "fuse" "kvm-intel" ];

  hardware.opengl.driSupport32Bit = true;
  hardware.pulseaudio.support32Bit = true;

  hardware.pulseaudio.enable = true;

  networking.hostName = "jethro-desktop"; # Define your hostname.

  services.xserver.videoDrivers = [ "nvidia" ];
}

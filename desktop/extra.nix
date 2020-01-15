{ config, pkgs, ... }:
{
  # Setup to support wireless driver
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelModules = [ "fuse" "kvm-intel" "coretemp" ];

  hardware.opengl.driSupport32Bit = true;
  hardware.pulseaudio.support32Bit = true;

  hardware.pulseaudio.enable = true;

  networking.hostName = "jethro-desktop"; # Define your hostname.

  services.xserver.videoDrivers = [ "nvidia" ];

  nix.buildCores = 4;

  environment.systemPackages = with pkgs; [
    calibre
  ];
}

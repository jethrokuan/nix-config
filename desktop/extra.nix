{ config, pkgs, ... }:
{
  # Setup to support wireless driver
  boot.kernelModules = [ "fuse" "kvm-intel" "coretemp" ];
  boot.extraModulePackages = [ pkgs.linuxPackages.rtl88xxau-aircrack ];

  hardware.opengl.driSupport32Bit = true;
  hardware.pulseaudio.support32Bit = true;

  hardware.pulseaudio.enable = true;

  networking.hostName = "jethro-desktop"; # Define your hostname.

  services.xserver.videoDrivers = [ "nvidia" ];

  nix.buildCores = 4;

  environment.systemPackages = with pkgs; [
    calibre
    steam
    slack
  ];
}

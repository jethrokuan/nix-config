{ config, pkgs, ... }:
{
  # Setup to support wireless driver
  boot.kernelModules = [ "fuse" "kvm-intel" "kvm-amd" "coretemp" ];
  boot.extraModulePackages = [ pkgs.linuxPackages.rtl88xxau-aircrack ];

  hardware.opengl.driSupport32Bit = true;
  hardware.pulseaudio.support32Bit = true;

  hardware.pulseaudio.enable = true;

  networking.hostName = "jethro-desktop"; # Define your hostname.

  services.xserver.videoDrivers = [ "nvidia" ];

  environment.systemPackages = with pkgs; [
    steam
    slack
    transmission-gtk
  ];
}

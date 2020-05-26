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

  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = ["jethro"];

  nix.buildCores = 4;

  environment.systemPackages = with pkgs; [
    calibre
    steam
    slack
  ];
}

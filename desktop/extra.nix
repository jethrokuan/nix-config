{ config, pkgs, ... }:
{
  # Setup to support wireless driver
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelModules = [ "kvm-intel" "rt2800usb" ];
  boot.extraModprobeConfig = ''
    alias usb:v0B05p17E8d*dc*dsc*dp*ic*isc*ip*in* rt2800usb
    install rt2800usb ${pkgs.kmod}/sbin/modprobe --ignore-install rt2800usb && echo 0x0B05 0x17E8 >/sys/bus/usb/drivers/rt2800usb/new_id
  '';

  hardware.pulseaudio.enable = true;

  networking.hostName = "jethro-desktop"; # Define your hostname.

  services.xserver.videoDrivers = [ "nvidia" ];
}

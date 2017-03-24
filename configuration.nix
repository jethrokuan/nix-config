# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  environment.etc."profile.local".text = 
  ''
  # /etc/profile.local: DO NOT EDIT - this file has been generated automatically.

  if test -f "$HOME/.profile"; then
    . "$HOME/.profile"
  fi
  '';
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix

      ./dropbox.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
 
  networking.hostName = "jethro-laptop"; # Define your hostname.
  networking.networkmanager.enable = true;

  # Select internationalisation properties.
   i18n = {
     consoleFont = "Lat2-Terminus16";
     consoleKeyMap = "dvorak";
     defaultLocale = "en_US.UTF-8";
   };

  # Set your time zone.
  time.timeZone = "Asia/Singapore";
  # services.ntp = {
  #   enable = true;
  #   servers = [ "0.pool.ntp.org" "1.pool.ntp.org" "2.pool.ntp.org" ];
  # };


  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget

  environment.systemPackages = with pkgs; [
    aspell
    findutils

    # System utilities
    fish
    gnugrep
    less
    tree
    stow
    unrar
    unzip
    xz
    zip

    # Dropbox
    dropbox

    # DEs
    emacs
  ];

  #Services
  services.openssh.enable = true;
  services.printing.enable = true;
  services.emacs.enable = true;
  programs.fish.enable = true;
  users.defaultUserShell = "/run/current-system/sw/bin/fish";

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.libinput.enable = true;
  services.xserver.layout = "dvorak";

  # Enable the XFCE Desktop environment
  services.xserver.desktopManager.xfce.enable = true;

  users.extraUsers.jethro = {
      isNormalUser = true;
      initialPassword = "password";
      uid = 1000;
      home = "/home/jethro";
      description = "Jethro Kuan";
      extraGroups = ["wheel" "networkmanager" ];
    };

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "16.09";

  system.autoUpgrade = {
    enable = true;
    channel = "https://nixos.org/channels/nixos-unstable";
  };
  
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [
    "webkitgtk-2.4.11"
  ];
}

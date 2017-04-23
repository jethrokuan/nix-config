# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

    
  nixpkgs.config.allowUnfree = true;

  # Setup to support wireless driver
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelModules = [ "kvm-intel" "rt2800usb" ];
  boot.extraModprobeConfig = ''
    alias usb:v0B05p17E8d*dc*dsc*dp*ic*isc*ip*in* rt2800usb
    install rt2800usb ${pkgs.kmod}/sbin/modprobe --ignore-install rt2800usb && echo 0x0B05 0x17E8 >/sys/bus/usb/drivers/rt2800usb/new_id
  '';

  sound.extraConfig =
    ''
      defaults.pcm.!card 1
      defaults.ctl.!card 1
    '';

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
 
  networking.hostName = "jethro-desktop"; # Define your hostname.
  networking.networkmanager.enable = true;

  # Select internationalisation properties.
   i18n = {
     consoleFont = "Lat2-Terminus16";
     consoleKeyMap = "dvorak";
     defaultLocale = "en_US.UTF-8";
   };

  # Set your time zone.
  time.timeZone = "Asia/Singapore";

  powerManagement.enable = true;

  environment = {
    shells = [
      "${pkgs.bash}/bin/bash"
      "${pkgs.fish}/bin/fish"
    ];
    variables = {
      BROWSER = pkgs.lib.mkOverride 0 "firefox";
      EDITOR = pkgs.lib.mkOverride 0 "emacs";
    };
    
   systemPackages = with pkgs; [
       # System utilities
       aspell
       gitAndTools.gitFull
       bash
       fish
       ripgrep
       fzf
       less
       tree
       rofi
       stow
       redshift

       # Archiving
       unrar
       unzip
       xz
       zip
       xarchiver

       # Web
       firefox
       conkeror

       # Language Support
       jdk

       # Tex
       texlive.combined.scheme-full

       # Dropbox
       dropbox-cli

       # PDF
       zathura

       # XFCE
       adapta-gtk-theme
       xfce.exo
       xfce.gtk_xfce_engine
       xfce.libxfce4ui
       xfce.libxfcegui4
       xfce.xfce4_battery_plugin
       xfce.xfwm4
       xfce.xfwm4themes
       xfce.thunar
       xfce.xfce4settings
       xfce.xfconf
       xfce.gvfs
   
       # DEs
       emacs
    ]; 
  };

  # programs.java.enable = true;
  programs.fish.enable = true;
  users.defaultUserShell = "/run/current-system/sw/bin/fish";

  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      corefonts
      iosevka
      source-code-pro
      source-sans-pro
      source-serif-pro
    ];

    fontconfig = {
      defaultFonts = {
       monospace = [ "Source Code Pro" ];
       sansSerif = [ "Source Sans Pro" ];
       serif = [ "Source Serif Pro" ];
      };
      ultimate = {
        enable = false;
      };
    };
  };

  #Services
  services.openssh.enable = true;
  services.printing.enable = true;
  services.emacs.enable = true;

  services.redshift = {
    enable = true;

    # Singapore
    latitude = "1.3521";
    longitude = "103.8198";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.libinput.enable = true;
  services.xserver.layout = "dvorak";

  # Enable the XFCE Desktop environment
  services.xserver.desktopManager.xfce.enable = true;
  #Thunar Volume Support
  services.udisks2.enable = true;
  services.xserver.desktopManager.xfce.thunarPlugins = [
    pkgs.xfce.thunar-archive-plugin
    pkgs.xfce.thunar-dropbox-plugin
    pkgs.xfce.thunar_volman
  ];

  users.extraUsers.jethro = {
      isNormalUser = true;
      initialPassword = "password";
      uid = 1000;
      home = "/home/jethro";
      description = "Jethro Kuan";
      extraGroups = ["wheel" "networkmanager" "uucp" ];
    };

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "16.09";

  system.autoUpgrade = {
    enable = true;
    channel = "https://nixos.org/channels/nixos-unstable";
  }; 
}

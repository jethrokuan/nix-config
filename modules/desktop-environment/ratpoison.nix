{ config, pkgs, ... }:
{
  imports = [
    # Compositor
    ./compton.nix
  ];

  environment.systemPackages = with pkgs; [
    dzen2
    conky
  ];

  services.xserver.desktopManager.gnome3.enable =true;
  services.xserver.desktopManager.default = "gnome3";
  services.xserver.windowManager.ratpoison.enable = true;
  services.xserver.windowManager.default = "ratpoison";
}

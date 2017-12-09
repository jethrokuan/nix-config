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

  services.xserver.windowManager.ratpoison.enable = true;
  services.xserver.windowManager.default = "ratpoison";
}

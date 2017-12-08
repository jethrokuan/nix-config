{ config, pkgs, ... }:
{
  imports = [
    # Compositor
    ./compton.nix
  ];

  services.xserver.windowManager.ratpoison.enable = true;
  services.xserver.windowManager.default = "ratpoison";
}

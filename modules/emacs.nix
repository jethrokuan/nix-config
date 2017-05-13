{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.emacs
  ];

  environment.variables.EDITOR = pkgs.lib.mkOverride 0 "emacs";
  
  services.emacs.enable = true;
}

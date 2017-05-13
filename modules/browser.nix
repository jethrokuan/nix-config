{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    firefox
    conkeror
  ];

  environment.variables.BROWSER = pkgs.lib.mkOverride 0 "firefox";
}

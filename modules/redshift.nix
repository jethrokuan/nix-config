{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.redshift
  ];

  services.redshift = {
    enable = true;
  };
}

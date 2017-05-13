{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.redshift
  ];

  services.redshift = {
    enable = true;

    # Singapore
    latitude = "1.3521";
    longitude = "103.8198";
  };
}

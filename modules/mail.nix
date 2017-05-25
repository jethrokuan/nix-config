{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    isync
    gnupg
    msmtp
  ];
}

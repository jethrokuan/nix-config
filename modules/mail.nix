{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    isync
    astroid
    gnupg
    msmtp
  ];


  # Required to install astroid
  nixpkgs.config.permittedInsecurePackages = [
         "webkitgtk-2.4.11"
  ];
}

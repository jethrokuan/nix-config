{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.jdk
  ];

  # Adds JAVA_HOME as a shell variable  
  programs.java.enable = true;
}

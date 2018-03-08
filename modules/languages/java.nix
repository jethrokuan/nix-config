{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    jetbrains.idea-ultimate
  ];

  # Adds JAVA_HOME as a shell variable  
  programs.java.enable = true;
}

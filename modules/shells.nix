{ config, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    # shells
    bash
    kitty
  ];

  environment.shells = [
    "${pkgs.bash}/bin/bash"
    "${pkgs.fish}/bin/fish"
  ];
}

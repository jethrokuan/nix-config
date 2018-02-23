{ config, pkgs, ... }:
{
  virtualisation.docker.enable = true;

  # give permission to socket
  users.extraUsers.jethro.extraGroups = ["docker"];
}

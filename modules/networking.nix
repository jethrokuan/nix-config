{pkgs, ...}:

let
  hostsVersion = "1553048103e57638ae653843ae1b8258ece1423a";
in
{
  networking.networkmanager.enable = true;

  networking.networkmanager.packages = with pkgs; [
    networkmanager_fortisslvpn
    networkmanager_openvpn
  ];

  networking.extraHosts = builtins.readFile (pkgs.fetchurl {
    url = "https://github.com/StevenBlack/hosts/raw/${hostsVersion}/alternates/fakenews-gambling-porn/hosts";
    sha256 = "0i10vdfpk98ddld6z6z32bw6q1wd0a7p2ayr1hrpckl6zckfrmn3";
  });
}

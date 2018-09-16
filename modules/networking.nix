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
    url = "https://github.com/StevenBlack/hosts/raw/${hostsVersion}/alternates/fakenews-gambling-porn-social/hosts";
    sha256 = "1x6x6ak8zamk0jbcfgf8bwqbn87vqdp0nnk51mxx6lh9s69v4dk1";
  });
}

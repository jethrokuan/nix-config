{pkgs, ...}:

let
  hostsVersion = "2daf2b0352ce1a8632610fd92e9db8238bdaab06";
in
{
  networking.networkmanager.enable = true;

  networking.networkmanager.packages = with pkgs; [
    networkmanager_fortisslvpn
    networkmanager_openvpn
  ];

  networking.extraHosts = builtins.readFile (pkgs.fetchurl {
    url = "https://github.com/StevenBlack/hosts/raw/${hostsVersion}/alternates/fakenews-gambling-porn/hosts";
    sha256 = "19dqbiyhi76ri384qc7aymj7j0v2i92lkyqyplyyzzb1xpl4gbpc";
  });
}

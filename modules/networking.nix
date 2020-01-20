{pkgs, ...}:

let
  version = "a8477304cacbced948559ac450160c3af0e4e132";
  type = "fakenews-gambling-porn";
in
{
  networking.networkmanager.enable = true;

  networking.networkmanager.packages = with pkgs; [
    networkmanager_fortisslvpn
    networkmanager_openvpn
  ];

  networking.extraHosts = builtins.readFile (pkgs.fetchurl {
    url = "https://github.com/StevenBlack/hosts/raw/${version}/alternates/${type}/hosts";
    sha256 = "19dqbiyhi76ri384qc7aymj7j0v2i92lkyqyplyyzzb1xpl4gbpc";
  });
}

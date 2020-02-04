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

  environment.systemPackages = with pkgs; [
    openfortivpn
  ];

  networking.extraHosts = builtins.readFile (pkgs.fetchurl {
    url = "https://github.com/StevenBlack/hosts/raw/${version}/alternates/${type}/hosts";
    sha256 = "1224242vsfyybvqmkxvjyp5715qvralb18b78b7mmy1r67s8pc1f";
  });
}

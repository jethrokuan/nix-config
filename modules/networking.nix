{config, pkgs, ...}:

{
  networking.extraHosts = builtins.readFile (pkgs.fetchurl {
    url = "https://github.com/StevenBlack/hosts/raw/aa60fb8642ae67da35f3004cd2a6dbe9c64ce9fe/alternates/fakenews-gambling-porn-social/hosts";
    sha256 = "1rf4823nkg95r1hlrhgfash1p0g7lz8c9zfgs5axqbjh1jqqq9w3";
  });
}

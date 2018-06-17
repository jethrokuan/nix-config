{ pkgs, ... }:

let
  emacsWithPackages = (pkgs.emacsPackagesNgGen pkgs.emacs).emacsWithPackages;
  inherit (import ./emacs-packages.nix {inherit pkgs;}) myPackages;
  emacs = emacsWithPackages myPackages;
in
{
  environment.systemPackages = [
      emacs
  ];

  services.emacs.package = emacs;
  services.emacs.enable = true;
}

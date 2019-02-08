{ pkgs, ... }:

let
  emacsWithPackages = (pkgs.emacsPackagesNgGen pkgs.emacs).emacsWithPackages;
  myPackages = import ./emacs-packages.nix;
  emacs = emacsWithPackages myPackages;
in
{
  environment.systemPackages = [
      emacs
      pkgs.proselint  #  linter for prose
  ];

  services.emacs.package = emacs;
  services.emacs.enable = true;
}

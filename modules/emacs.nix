{ pkgs, ... }:

let
  inherit (pkgs) stdenv;
  inherit (stdenv) lib;

  withPatches = pkg: patches:
    lib.overrideDerivation pkg (attrs: { inherit patches; });

  emacsWithPackages = (pkgs.emacsPackagesNgGen pkgs.emacsGit).emacsWithPackages;

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

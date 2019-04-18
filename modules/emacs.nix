{ pkgs, ... }:

let
  inherit (pkgs) stdenv;
  inherit (stdenv) lib;

  withPatches = pkg: patches:
    lib.overrideDerivation pkg (attrs: { inherit patches; });

  myEmacs = pkgs.emacs.override { inherit (pkgs) imagemagick; };

  emacsWithPackages = (pkgs.emacsPackagesNgGen myEmacs).emacsWithPackages;

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

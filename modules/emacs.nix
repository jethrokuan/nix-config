{ pkgs, ... }:

let
  inherit (pkgs) stdenv;
  inherit (stdenv) lib;

  emacsWithPackages = (pkgs.emacsPackagesNgGen pkgs.emacsGit).emacsWithPackages;
in emacsWithPackages (epkgs: [
  epkgs.exwm
  epkgs.emacs-libvterm
])

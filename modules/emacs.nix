{ pkgs, ... }:

let
  inherit (pkgs) stdenv;
  inherit (stdenv) lib;

  emacsWithPackages = (pkgs.emacsPackagesNgGen pkgs.emacsGit).emacsWithPackages;
in emacsWithPackages (epkgs: with epkgs; [
  exwm
  emacs-libvterm
])

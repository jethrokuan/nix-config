{ pkgs, ... }:

let
  inherit (pkgs) stdenv;
  inherit (stdenv) lib;

  withPatches = pkg: patches:
    lib.overrideDerivation pkg (attrs: { inherit patches; });

  customEmacsPackages = pkgs.emacsPackagesNg.overrideScope' (self: super: super // {
    ox-hugo = withPatches super.ox-hugo [ ./patches/ox-hugo-escape-curly.patch ];
  });

  myPackages = import ./emacs-packages.nix;
  emacs = customEmacsPackages.emacsWithPackages myPackages;
in
{
  environment.systemPackages = [
      emacs
      pkgs.proselint  #  linter for prose
  ];

  services.emacs.package = emacs;
  services.emacs.enable = true;
}

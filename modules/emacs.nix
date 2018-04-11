{ pkgs, ... }:

let
  emacs26 = pkgs.stdenv.lib.overrideDerivation pkgs.emacs (oldAttrs : {
    version = "26.1RC1";
    src = pkgs.fetchurl {
      url = "ftp://alpha.gnu.org/gnu/emacs/pretest/emacs-26.1-rc1.tar.xz";
      sha256 = "6594e668de00b96e73ad4f168c897fe4bca7c55a4caf19ee20eac54b62a05758";
    };
    patches = [];
  });
  emacsWithPackages = (pkgs.emacsPackagesNgGen emacs26).emacsWithPackages;
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

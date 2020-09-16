{config, pkgs, ...}:

{
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/emacs-overlay/archive/master.tar.gz;
    }))
    (self: super: {
      emacsWithPackages = (pkgs.emacsPackagesNgGen pkgs.emacsGit).emacsWithPackages;
    })
    (self: super: {
      xdg_utils = super.xdg_utils.override {
        mimiSupport = true;
      };
    }
    )];
}

{config, pkgs, ...}:

{
  nixpkgs.overlays = [(self: super:
    {
      xdg_utils = super.xdg_utils.override {
        mimiSupport = true;
      };

      et-book = super.callPackage ../packages/et-book.nix { };
    }
  )];
}

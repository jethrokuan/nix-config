{config, pkgs, ...}:

{
  nixpkgs.overlays = [
    (self: super: {
      xdg_utils = super.xdg_utils.override {
        mimiSupport = true;
      };
    }
    )];
}

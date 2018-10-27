{config, pkgs, ...}:

{
  nixpkgs.overlays = [(self: super:
    {
      xdg_utils = super.xdg_utils.override {
        mimiSupport = true;
      };

      steam = super.steam.override {
        extraPkgs = pkgs: with pkgs; [ libudev ];
      };
    }
  )];
}

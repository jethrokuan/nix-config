{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    emacs

    # Python packages for dev
    python27Full
    python27Packages.flake8
    python27Packages.isort
    python27Packages.yapf
  ];

  environment.variables.EDITOR = pkgs.lib.mkOverride 0 "emacs";
  
  services.emacs.enable = true;
}

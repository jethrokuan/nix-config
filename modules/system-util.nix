{config, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    direnv
    wget
    aspell
    gitAndTools.gitFull      
    ripgrep
    fzf
    less
    tree
    rofi
    rofi-pass
    pass
    stow
    nox
  ];
}

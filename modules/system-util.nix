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
    stow
    nox
  ];
}

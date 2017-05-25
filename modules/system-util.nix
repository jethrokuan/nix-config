{config, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    direnv
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

{config, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
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

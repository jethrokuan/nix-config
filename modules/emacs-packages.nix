{ pkgs, ... }:

let
  myPackages = (epkgs: (with epkgs.melpaPackages; [
    aggressive-indent
    alchemist
    autodisass-java-bytecode
    avy
    beacon
    bury-successful-compilation
    clj-refactor
    company-anaconda
    company-auctex
    company-go
    company-tern
    counsel-projectile
    company-quickhelp
    crux
    deft
    diff-hl
    diminish
    dired-narrow
    dired-ranger
    dired-subtree
    direnv
    docker
    dockerfile-mode
    dumb-jump
    easy-kill
    elfeed
    elfeed-org
    elixir-mode
    emmet-mode
    ensime
    esh-autosuggest
    esup
    eww-lnum
    expand-region
    eyebrowse
    fish-mode
    flx
    flycheck-clojure
    flycheck-color-mode-line
    flycheck-pos-tip
    gist
    gradle-mode
    go-mode
    golint
    go-dlv
    gorepl-mode
    golden-ratio
    google-c-style
    haskell-mode
    highlight-indent-guides
    htmlize
    ibuffer-projectile
    iedit
    indium
    interleave
    intero
    isend-mode
    ivy-bibtex
    js-doc
    js2-refactor
    json-mode
    key-chord
    magit
    # magithub
    markdown-mode
    meghanada
    nix-mode
    no-littering
    notmuch
    olivetti
    org-ref
    org-download
    org-gcal
    org-journal
    org-pomodoro
    ox-ioslide
    paradox
    pdf-tools
    peep-dired
    projectile
    py-isort
    pytest
    rainbow-delimiters
    rg
    rjsx-mode
    rust-mode
    scss-mode
    shackle
    shm
    skewer-mode
    slime-company
    smart-mode-line
    smartparens
    sos
    sphinx-doc
    tide
    typescript-mode
    use-package
    visual-regexp
    volatile-highlights
    web-mode
    wgrep
    ws-butler
    which-key
    yaml-mode
    yapfify
    zenburn-theme
  ] ++
  [
    epkgs.orgPackages.org-plus-contrib
    epkgs.rainbow-mode
  ]));
in
{
  myPackages = myPackages;
}

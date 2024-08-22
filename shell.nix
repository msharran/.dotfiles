let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-24.05";
  pkgs = import nixpkgs { config = {}; overlays = []; };
in

pkgs.mkShellNoCC {
  packages = with pkgs; [
    git
    neovim 
    lua 
    luajit 
    rustc 
    cargo 
    nodejs_22
    go
    hack-font
    fd
    bat
    fzf
  ];

  shellHook = ''
    fish 
  '';
}

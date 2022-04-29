{ pkgs ? import <nixpkgs> { } }:

with pkgs;

let
  haskellPackagesOverlayed = haskell.packages.ghc921.override {
    overrides = self: super: {
      FPretty = haskell.lib.doJailbreak super.FPretty;
    };
  };

  hsenv = haskellPackagesOverlayed.ghcWithPackages (p:
    with p;
    [
      cabal-install
      #hood
      #FPretty
      #dyepack
      #ghc-debug-brick
      #ghc-debug-client
      #ghc-debug-stub
      #ghc-heap-view ghc-vis
      #heapsize

    ]);

in mkShell {
  buildInputs = [ graphviz hsenv nixfmt ];
  shellHook = ''
    export XDG_DATA_DIRS=${gsettings-desktop-schemas}/share/gsettings-schemas/${gsettings-desktop-schemas.name}:${gtk3}/share/gsettings-schemas/${gtk3.name}:$XDG_DATA_DIRS
  '';

}

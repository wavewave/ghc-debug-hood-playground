{ pkgs ? import <nixpkgs> { } }:

with pkgs;

let
  haskellPackagesOverlayed = haskell.packages.ghc921.override {
    overrides = self: super: {
      FPretty = haskell.lib.doJailbreak super.FPretty;
    };
  };

  hsenv =
    haskellPackagesOverlayed.ghcWithPackages (p: with p; [ cabal-install ]);

in mkShell {
  buildInputs = [ graphviz hsenv ];
  shellHook = ''
    export XDG_DATA_DIRS=${gsettings-desktop-schemas}/share/gsettings-schemas/${gsettings-desktop-schemas.name}:${gtk3}/share/gsettings-schemas/${gtk3.name}:$XDG_DATA_DIRS
  '';

}

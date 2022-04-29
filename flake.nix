{
  description = "ghc-debug and HOOD playground experiment";
  inputs = { nixpkgs.url = "github:NixOS/nixpkgs/nixos-21.11"; };
  outputs = { self, nixpkgs }:
    let pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in {
      devShell.x86_64-linux = with pkgs;
        let
          hsenv = haskell.packages.ghc921.ghcWithPackages
            (p: with p; [ cabal-install ]);
        in mkShell {
          buildInputs = [ graphviz hsenv ];
          shellHook = ''
            export XDG_DATA_DIRS=${gsettings-desktop-schemas}/share/gsettings-schemas/${gsettings-desktop-schemas.name}:${gtk3}/share/gsettings-schemas/${gtk3.name}:$XDG_DATA_DIRS
          '';
        };
    };
}

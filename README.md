# ghc-debug-hood-playground

This is a meta-playground repo for playing around with [ghc-debug](https://gitlab.haskell.org/ghc/ghc-debug) and [HOOD](http://ku-fpg.github.io/software/hood).

## Clone and build dependencies

### Prerequisites

This project requires users to have nix >= 2.4 to use flake.

To enable nix flakes, add
```
experimental-features = nix-command flakes
```
to nix.extraOptions if using NixOS, or to /etc/nix/nix.conf or ~/.config/nix/nix.conf otherwise.

### v2-build in local nix shell

```
$ git clone <url_for_this_repo>
$ git submodule init
$ git submodule update
$ nix develop .#
$ cabal v2-build all
```
## Play around

### HOOD inspection

```
$ cabal v2-exec runhaskell script/hood-test.hs
```

### ghc-debug inspection

1. run debuggee process (in nix develop shell)
```
$ GHC_DEBUG_SOCKET=/tmp/ghc-debug cabal v2-exec runhaskell script/debuggee.hs
```
2. run inspector process (in another nix develop shell)
```
$ cabal v2-exec runhaskell script/inspector.hs
```

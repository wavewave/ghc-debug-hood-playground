# ghc-debug-hood-playground

This is a meta-playground repo for playing around with [ghc-debug](https://gitlab.haskell.org/ghc/ghc-debug) and [HOOD](http://ku-fpg.github.io/software/hood).

## Clone and build dependencies

```
$ git clone <url_for_this_repo>
$ git submodule init
$ git submodule update
$ nix-shell
$ cabal v2-build all
```
## Play around

### HOOD inspection

```
$ cabal v2-exec runhaskell script/hood-test.hs
```

### ghc-debug inspection

1. run debuggee process (in nix-shell)
```
$ GHC_DEBUG_SOCKET=/tmp/ghc-debug cabal v2-exec runhaskell script/debuggee.hs
```
2. run inspector process (in another nix-shell)
```
$ cabal v2-exec runhaskell script/inspector.hs
```

# ghc-debug-hood-playground

This is a meta-playground repo for playing around with [ghc-debug](https://gitlab.haskell.org/ghc/ghc-debug) and [hood](http://ku-fpg.github.io/software/hood).

## Clone and build dependencies

```
$ git clone <url_for_this_repo>
$ git submodule init
$ git submodule update
$ nix-shell
$ cabal v2-build all
```
## Play around

```
$ cabal v2-exec runhaskell hood-test.hs
```

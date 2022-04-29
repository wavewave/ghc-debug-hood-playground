module Main where

import Control.Concurrent (threadDelay)
import GHC.Debug.Stub (withGhcDebug)

normalMain :: IO ()
normalMain = do
  putStrLn "hello world"
  threadDelay 10_000_000

main :: IO ()
main = withGhcDebug normalMain

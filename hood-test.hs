module Main where

import Debug.Hood.Observe (observe, runO)
import System.IO (IO, print)

main :: IO ()
main = do
  let xs = [1, 2, 3] :: [Int]
  runO (print [observe "+1" (+ 1) x | x <- observe "xs" xs])

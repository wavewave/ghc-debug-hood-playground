module Main where

import Data.Foldable (for_)
import Debug.Hood.Observe
  ( Output,
    cdssToOutput,
    commonOutput,
    debugO,
    nil,
    observe,
    renderTop,
    rmEntrySet,
    simplifyCDSSet,
  )
import System.IO (IO, getLine, hPutStrLn, print, stderr)
import Text.PrettyPrint.FPretty (pretty, (<>))
import Prelude hiding ((<>))

runO' :: IO a -> IO ()
runO' program = do
  cdss <- debugO program
  let cdss1 = rmEntrySet cdss
  let cdss2 = simplifyCDSSet cdss1
  let output1 = cdssToOutput cdss2
  let output2 :: [Output]
      output2 = commonOutput output1

  getLine
  for_ output2 $ \o -> do
    let rendered = pretty 80 $ renderTop o
    hPutStrLn stderr ""
    hPutStrLn stderr rendered
    getLine

main :: IO ()
main = do
  let xs = [1, 2, 3] :: [Int]
  runO' (print [observe "+1" (+ 1) x | x <- observe "xs" xs])

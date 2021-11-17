module Main where

import qualified SimpleList as L

main :: IO ()
main = do
    let list = L.toList[1,2,3,4,5,6]
    let newList = L.map' (*2) list
    print newList 

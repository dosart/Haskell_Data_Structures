module Main where
import qualified BinaryTree as B

import qualified SimpleList as L

main :: IO ()
main
  = do let list = L.toList [1, 2, 3, 4, 5, 6]
       let newList = L.map' (* 2) list
       print newList

       let numsTree = B.fromList [8, 6, 4, 1, 7, 3, 5]
       print numsTree

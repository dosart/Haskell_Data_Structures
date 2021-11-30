module Main where
import qualified BinaryTree as B

import qualified Maybe as M
import qualified SimpleList as L

main :: IO ()
main
  = do let list = L.toList [1, 2, 3, 4, 5, 6, 7]

       print (M.Just 5)

       let newList = L.map' (* 2) list
       print newList

       let numsTree = B.fromList [8, 6, 4, 1, 7, 3, 5]
       let newTree = B.treeMap (* 2) numsTree
       print numsTree

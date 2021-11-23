{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
module BinaryTree (treeInsert, fromList, leaf, folder, treeMap) where
import Control.Arrow (ArrowChoice(right))

data BinaryTree a = Empty
                  | Node (BinaryTree a) a (BinaryTree a)
                      deriving (Show)

instance Functor BinaryTree where
        fmap = treeMap

toList :: BinaryTree a -> [a]
toList = folder [] (\ left x right -> left ++ [x] ++ right)

fromList :: Ord a => [a] -> BinaryTree a
fromList = foldr treeInsert Empty

treeInsert :: Ord a => a -> BinaryTree a -> BinaryTree a
treeInsert x Empty = leaf x
treeInsert x (Node left a right)
  | x == a = Node left a right
  | x < a = Node (treeInsert x left) a right
  | otherwise = Node left a (treeInsert x right)

treeMinimum :: Ord a => BinaryTree a -> Maybe a
treeMinimum Empty = Nothing 
treeMinimum (Node Empty a right) = Just a 
treeMinimum (Node left  _ _) = treeMinimum left 

leaf :: Ord a => a -> BinaryTree a
leaf x = Node Empty x Empty

size :: BinaryTree a -> Integer
size = folder 0 (\ left x right -> 1 + left + right)

depth :: BinaryTree a -> Integer
depth = folder 0 (\ left x right -> 1 + max left right)

treeMap :: (a -> b) -> BinaryTree a -> BinaryTree b
treeMap f = folder Empty (\ left x right -> Node left (f x) right)

folder :: b -> (b -> a -> b -> b) -> BinaryTree a -> b
folder ini _ Empty = ini
folder ini f (Node l a r) = f (folder ini f l) a (folder ini f r)


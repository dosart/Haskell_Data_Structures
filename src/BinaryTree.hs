{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
module BinaryTree (insert, fromList, leaf, folder) where

data BinaryTree a = Empty
                  | Node (BinaryTree a) a (BinaryTree a)
                      deriving (Show)

toList :: BinaryTree a -> [a]
toList = folder [] (\left x right -> left ++ [x] ++ right)

fromList :: Ord a => [a] -> BinaryTree a
fromList = foldr insert Empty

insert :: Ord a => a -> BinaryTree a -> BinaryTree a
insert x Empty = leaf x
insert x (Node left a right)
  | a == x = Node left a right
  | a < x = Node (insert x left) a right
  | otherwise = Node left a (insert x right)

leaf :: Ord a => a -> BinaryTree a
leaf x = Node Empty x Empty

folder :: b -> (b -> a -> b -> b) -> BinaryTree a -> b
folder ini _ Empty = ini
folder ini f (Node l a r) = f (folder ini f l) a (folder ini f r)


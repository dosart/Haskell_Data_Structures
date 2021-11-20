module BinaryTree (insert, fromList, leaf) where

data BinaryTree a = Empty
                  | Node a (BinaryTree a) (BinaryTree a)
                      deriving (Show)

fromList :: Ord a => [a] -> BinaryTree a
fromList = foldr insert Empty

insert :: Ord a => a -> BinaryTree a -> BinaryTree a
insert x Empty = leaf x
insert x (Node a left right)
  | a == x = Node a left right
  | a < x = Node a (insert x left) right
  | otherwise = Node a left (insert x right)

leaf :: Ord a => a -> BinaryTree a
leaf x = Node x Empty Empty

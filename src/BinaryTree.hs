{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
module BinaryTree (insert, fromList, leaf, folder, map) where

data BinaryTree a = Empty
                  | Node (BinaryTree a) a (BinaryTree a)
                      deriving (Show)

instance Functor BinaryTree where
        fmap = BinaryTree.map

toList :: BinaryTree a -> [a]
toList = folder [] (\ left x right -> left ++ [x] ++ right)

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

size :: BinaryTree a -> Integer
size = folder 0 (\ left x right -> 1 + left + right)

depth :: BinaryTree a -> Integer
depth = folder 0 (\ left x right -> 1 + max left right)

map :: (a -> b) -> BinaryTree a -> BinaryTree b
map f = folder Empty (\ left x right -> Node left (f x) right)

folder :: b -> (b -> a -> b -> b) -> BinaryTree a -> b
folder ini _ Empty = ini
folder ini f (Node l a r) = f (folder ini f l) a (folder ini f r)


{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
module BinaryTree (treeInsert, fromList, toList, leaf, treeFolder, treeMap, treeMinimum, treeMaximum, treeEmpty, treeSize) where

data (Ord a, Eq a) => BinaryTree a = Empty
                  | Node (BinaryTree a) a (BinaryTree a)
                      deriving (Show)

instance Functor BinaryTree where
        fmap = treeMap

toList :: BinaryTree a -> [a]
toList = treeFolder [] (\ left x right -> left ++ [x] ++ right)

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
treeMinimum (Node left x right) = return (treeFolder x (\left x right -> min x (min left right)) (Node left x right))

treeMaximum :: Ord a => BinaryTree a -> Maybe a
treeMaximum Empty = Nothing 
treeMaximum (Node left x right) = return (treeFolder x (\left x right -> max x (max left right)) (Node left x right))

leaf :: Ord a => a -> BinaryTree a
leaf x = Node Empty x Empty

treeSize :: BinaryTree a -> Integer
treeSize = treeFolder 0 (\ left x right -> 1 + left + right)

treeEmpty :: BinaryTree a -> Bool
treeEmpty Empty = True
treeEmpty _ = False

treeDepth :: BinaryTree a -> Integer
treeDepth = treeFolder 0 (\ left x right -> 1 + max left right)

treeMap :: (a -> b) -> BinaryTree a -> BinaryTree b
treeMap f = treeFolder Empty (\ left x right -> Node left (f x) right)

treeFolder :: b -> (b -> a -> b -> b) -> BinaryTree a -> b
treeFolder ini _ Empty = ini
treeFolder ini f (Node l a r) = f (treeFolder ini f l) a (treeFolder ini f r)


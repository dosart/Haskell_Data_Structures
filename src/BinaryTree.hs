{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
module BinaryTree
       (treeInsert, fromList, toList, leaf, treeFolds, treeMap, treeMinimum,
        treeMaximum, treeEmpty, treeSize)
       where

data (Ord a, Eq a) => BinaryTree a = Empty
                                   | Node (BinaryTree a) a (BinaryTree a)
                                       deriving (Show)

instance Functor BinaryTree where
        fmap = treeMap

toList :: BinaryTree a -> [a]
toList = treeFolds [] (\ left x right -> left ++ [x] ++ right)

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
treeMinimum (Node left x right)
  = return
      (treeFolds x (\ left x right -> min x (min left right))
         (Node left x right))

treeMaximum :: Ord a => BinaryTree a -> Maybe a
treeMaximum Empty = Nothing
treeMaximum (Node left x right)
  = return
      (treeFolds x (\ left x right -> max x (max left right))
         (Node left x right))

leaf :: Ord a => a -> BinaryTree a
leaf x = Node Empty x Empty

treeSize :: BinaryTree a -> Integer
treeSize = treeFolds 0 (\ left x right -> 1 + left + right)

treeEmpty :: BinaryTree a -> Bool
treeEmpty Empty = True
treeEmpty _ = False

treeDepth :: BinaryTree a -> Integer
treeDepth = treeFolds 0 (\ left x right -> 1 + max left right)

treeMap :: (a -> b) -> BinaryTree a -> BinaryTree b
treeMap f = treeFolds Empty (\ left x right -> Node left (f x) right)

treeFolds :: b -> (b -> a -> b -> b) -> BinaryTree a -> b
treeFolds ini _ Empty = ini
treeFolds ini f (Node l a r) = f (treeFolds ini f l) a (treeFolds ini f r)

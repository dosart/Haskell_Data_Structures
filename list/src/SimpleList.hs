{-# OPTIONS_GHC -Wno-incomplete-patterns #-}

module SimpleList where

infix 5 :-:

data List a = Empty | a :-: (List a)
  deriving (Show)

instance Functor List where
  fmap = map'


addItem :: List a -> a -> List a
addItem Empty _ = Empty
addItem xs x = x :-: xs

removeItem :: (Eq a) => a -> List a -> List a
removeItem _ Empty = Empty
removeItem x (y :-: ys)
  | x == y = removeItem x ys
  | otherwise = y :-: removeItem x ys

size :: List a -> Int
size Empty = 0
size (x :-: xs) = 1 + size xs

head' :: List a -> Either String a
head' Empty = Left "List is empty"
head' (x :-: xs) = Right x

tail' :: List a -> Either String (List a)
tail' Empty = Left "List is empty"
tail' (x :-: xs) = Right xs

concat' :: List a -> List a -> List a
concat' Empty xs = xs
concat' xs Empty = xs
concat' (x :-: xs) ys = x :-: concat' xs ys

elem' :: (Eq a) => a -> List a -> Bool
elem' _ Empty = False
elem' n (x :-: xs)
  | x == n = True
  | otherwise = elem' n xs

fromList :: List a -> [a]
fromList Empty = []
fromList (x :-: xs) = x : fromList xs

toList :: [a] -> List a
toList = foldr (:-:) Empty

replicate' :: Int -> a -> List a
replicate' n x
  | n <= 0 = Empty
  | otherwise = x :-: replicate' (n -1) x

take' :: Int -> List a -> List a
take' _ Empty = Empty
take' n (x :-: xs)
  | n <= 0 = Empty
  | otherwise = x :-: take' (n -1) xs

zip' :: List a -> List b -> List (a, b)
zip' _ Empty = Empty
zip' Empty _ = Empty
zip' (x :-: xs) (y :-: ys) = (x, y) :-: zip' xs ys

map' :: (a -> b) -> List a -> List b
map' _ Empty = Empty
map' f (x :-: xs) = f x :-: map' f xs

filter' :: (a -> Bool) -> List a -> List a
filter' _ Empty = Empty
filter' f (x :-: xs)
  | f x = x :-: filter' f xs
  | otherwise = filter' f xs

foldr' :: (a -> b -> b) -> b -> List a -> b
foldr' _ ini Empty = ini
foldr' f ini (x :-: xs) = x `f` foldr' f ini xs

-- folder version

map'' :: (a -> b) -> List a -> List b
map'' f = foldr' (\x acc -> f x :-: acc) Empty

filter'' :: (a -> Bool) -> List a -> List a
filter'' f = foldr' (\x acc -> if f x then x :-: acc else acc) Empty

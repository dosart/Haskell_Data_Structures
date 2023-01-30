module Maybe where

import Prelude hiding (Just, Maybe, Nothing)

data Maybe a = Nothing
             | Just a
                 deriving (Show, Eq, Ord)

instance Functor Maybe where
        fmap _ Nothing = Nothing
        fmap f (Just x) = Just (f x)
        
instance Applicative Maybe where
        pure x = Just x
        
        Nothing  <*> _ = Nothing
        (Just f) <*> x =  fmap f x

instance Monad Maybe where
        return x = Just x
        
        Nothing  >>= _ = Nothing
        (Just x) >>= k = Just (k x)
        
        Nothing  >> _ = Nothing
        (Just x) >> m = m
        
        fail _ = Nothing

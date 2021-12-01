module Maybe where

import Prelude hiding (Just, Maybe, Nothing)

data Maybe a = Nothing
             | Just a
                 deriving (Show)

instance Functor Maybe where
        fmap _ Nothing = Nothing
        fmap f (Just x) = Just (f x)
        
instance Applicative Maybe where
        pure x = Just x
        
        Nothing  <*> _ = Nothing
        (Just f) <*> x =  fmap f x

module Maybe where

import Prelude hiding (Just, Maybe, Nothing)

data Maybe a = Nothing
             | Just a
                 deriving (Show)

instance Functor Maybe where
        fmap _ Nothing = Nothing
        fmap f (Just x) = Just (f x)

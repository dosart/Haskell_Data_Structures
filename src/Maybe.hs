import Prelude hiding (Functor, Just, Maybe, Nothing, fmap)

data Maybe a = Nothing
             | Just a

instance Functor Maybe where
        fmap _ Nothing = Nothing
        fmap f (Just x) = Just (f x)

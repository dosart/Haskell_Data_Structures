import Prelude hiding (Maybe, Just, Nothing, Functor, fmap)

data Maybe a = Nothing | Just a

instance Functor Maybe where
  fmap _ Nothing = Nothing
  fmap f (Just x) = Just (f x)

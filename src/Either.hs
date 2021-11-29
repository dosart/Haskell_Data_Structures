import Prelude hiding (Either, Left, Right, Functor, fmap)

data Either a b = Left a | Right b

instance Functor Either e where
  fmap _ (Left x) = Left x
  fmap f (Right x) = Right (f x)

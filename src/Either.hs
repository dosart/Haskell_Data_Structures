module Either where
import Prelude hiding (Either, Left, Right)

data Either a b = Left a
                | Right b
                    deriving (Show)

instance Functor (Either e) where
        fmap _ (Left x) = Left x
        fmap f (Right x) = Right (f x)

instance Monad (Either e) where
        return = Right

        (Left  x) >>= _ = Left x
        (Right x) >>= k = k r

        fail = Left

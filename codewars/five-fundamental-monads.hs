-- https://www.codewars.com/kata/five-fundamental-monads

{-# LANGUAGE NoImplicitPrelude #-}

module Monads where

import Prelude hiding (Maybe(..), Monad)

class Monad m where
  return :: a -> m a
  (>>=) :: m a -> (a -> m b) -> m b

newtype Identity a = Identity { runIdentity :: a } deriving (Eq, Show)

data Maybe a = Nothing | Just a deriving (Eq, Show)

newtype State s a = State { runState :: s -> (a, s) }

newtype Reader r a = Reader { runReader :: r -> a }

newtype Writer w a = Writer { runWriter :: (a, w) }

instance Monad Identity where
  return = Identity
  Identity x >>= f = f x

instance Monad Maybe where
  return = Just
  Just x >>= f = f x
  Nothing >>= _ = Nothing

instance Monad (State s) where
  return x = State $ \s -> (x, s)
  State h >>= f = State $ \s -> let (x, s') = h s; State h' = f x in h' s'

instance Monad (Reader r) where
  return x = Reader $ const x
  Reader h >>= f = Reader $ \r -> let Reader h' = f $ h r in h' r

instance Monoid w => Monad (Writer w) where
  return x = Writer (x, mempty)
  Writer (x, w) >>= f = let Writer (x', w') = f x in Writer (x', mappend w w')

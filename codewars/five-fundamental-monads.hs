-- https://www.codewars.com/kata/five-fundamental-monads

{-# LANGUAGE NoImplicitPrelude #-}

module Monads where

import Prelude hiding (Maybe(..), Monad)

class Monad m where
  return :: a -> m a
  (>>=) :: m a -> (a -> m b) -> m b

newtype Identity a = Identity { runIdentity :: a }
  deriving (Eq, Show)

data Maybe a = Nothing | Just a
  deriving (Eq, Show)

newtype State s a = State { runState :: s -> (a, s) }

newtype Reader s a = Reader { runReader :: s -> a }

newtype Writer w a = Writer { runWriter :: (w, a) }

instance Monad Identity where
  return = Identity
  (Identity v) >>= f = f v

instance Monad Maybe where
  return = Just
  Nothing >>= _ = Nothing
  (Just v) >>= f = f v

instance Monad (State s) where
  return v = State $ \s -> (v, s)
  (State c) >>= f = State $ \s -> let (vi, si) = c s; (State ci) = f vi in ci si

instance Monad (Reader s) where
  return v = Reader $ const v
  (Reader c) >>= f = Reader $ \s -> let (Reader ci) = f $ c s in ci s

instance Monoid w => Monad (Writer w) where
  return v = Writer (mempty, v)
  (Writer (r, v)) >>= f = Writer $ let (Writer (ri, vi)) = f v in (mappend r ri, vi)

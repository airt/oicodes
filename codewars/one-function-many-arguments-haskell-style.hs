-- https://www.codewars.com/kata/one-function-many-arguments-haskell-style

{-# LANGUAGE InstanceSigs #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE FunctionalDependencies #-}

module PolyvariadicFunctions where

class Poly a r t | t -> r where
  poly :: ([a] -> r) -> t

instance Poly a r r where
  poly :: ([a] -> r) -> r
  poly f = f []

instance (a ~ a', Poly a r t) => Poly a' r (a -> t) where
  poly :: ([a] -> r) -> a -> t
  poly f x = poly f' where f' xs = f (x : xs)

polyAdd :: Poly Int Int t => t
polyAdd = poly (sum :: [Int] -> Int)

polyWords :: Poly String String t => t
polyWords = poly unwords

polyList :: Poly a [a] t => t
polyList = poly id

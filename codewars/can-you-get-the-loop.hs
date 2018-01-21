-- https://www.codewars.com/kata/can-you-get-the-loop

module CanYouGetTheLoop where

import CanYouGetTheLoop.Types

{-
data Node a

instance Eq a => Eq (Node a)

next :: Node a -> Node a
-}

loopSize :: Eq a => Node a -> Int
loopSize head = walk 1 (next intersection) intersection
  where
    intersection = race head (next head)
    race x y
      | x == y = x
      | otherwise = race (next x) (next $ next y)
    walk n x t
      | x == t = n
      | otherwise = walk (succ n) (next x) t

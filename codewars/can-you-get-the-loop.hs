-- https://www.codewars.com/kata/can-you-get-the-loop

module CanYouGetTheLoop where

import CanYouGetTheLoop.Types
import Data.List (elemIndex)

{-
data Node a

instance Eq a => Eq (Node a)

next :: Node a -> Node a
-}

loopSize :: Eq a => Node a -> Int
loopSize = h []
  where
    h memo node =
      case elemIndex node memo of
        Just i -> i + 1
        Nothing -> h (node : memo) (next node)

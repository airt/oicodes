-- https://www.codewars.com/kata/simple-fun-number-299-look-and-say-and-sum

module Haskell.Codewars.LookAndSayAndSum where

import Data.List (group)

lookAndSaySum :: Int -> Int
lookAndSaySum = sum . (lookAndSays !!) . pred
  where
    lookAndSays = iterate ((lengthAndHead =<<) . group) [1]
    lengthAndHead = sequence [length, head]

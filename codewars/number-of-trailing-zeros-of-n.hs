-- https://www.codewars.com/kata/number-of-trailing-zeros-of-n

module Zeros where

zeros :: Int -> Int
zeros n = h n 0
  where
    h n z = let r = div n 5 in if r == 0 then z else h r (z + r)

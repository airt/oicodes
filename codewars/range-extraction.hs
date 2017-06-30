-- https://www.codewars.com/kata/range-extraction

module RangeExtractor.JorgeVS.Kata where

import Data.List (intercalate)

data Ros = Single Int | Range Int Int
  deriving (Eq, Show)

stringify :: Ros -> String
stringify (Single x) = show x
stringify (Range x y) = show x ++ "-" ++ show y

aptrs :: Int -> [Ros] -> [Ros]
aptrs x (Range b e : rs) | x == b - 1 =
  Range x e : rs
aptrs x (Single y : Single z : rs) | x == y - 1 && x == z - 2 =
  Range x z : rs
aptrs x rs =
  Single x : rs

solution :: [Int] -> String
solution = intercalate "," . map stringify . foldr aptrs []

-- https://www.codewars.com/kata/escape-the-mines

module EscapeTheMines where

import Control.Arrow (first, second)
import Data.Function (on)
import Data.List (minimumBy)
import Data.Maybe (catMaybes, fromJust)
import Data.Set (Set, empty, insert, member)

type XY = (Int, Int)

data Move = U | D | L | R
  deriving (Eq, Show)

(?!) :: [a] -> Int -> Maybe a
m ?! n | 0 <= n && n < length m = Just $ m !! n
_ ?! _ = Nothing

(?!!) :: [[a]] -> XY -> Maybe a
m ?!! (x, y) = (?! y) =<< (?! x) m

living :: [[Bool]] -> XY -> Bool
living m i = m ?!! i == Just True

ensureNonEmpty :: [a] -> Maybe [a]
ensureNonEmpty [] = Nothing
ensureNonEmpty xs = Just xs

dfs :: Set XY -> [[Bool]] -> XY -> XY -> Maybe [Move]
dfs _ m i _ | not $ living m i = Nothing
dfs _ _ i o | i == o = Just []
dfs v _ i _ | member i v = Nothing
dfs v m i o = minMoves <$> moveses
  where
    minMoves = minimumBy $ on compare length
    moveses = ensureNonEmpty . catMaybes $ uncurry explore <$> mvs
    explore mv step = (mv :) <$> dfs (insert i v) m (step i) o
    mvs = [(U, second pred), (D, second succ), (L, first pred), (R, first succ)]

solve :: [[Bool]] -> XY -> XY -> [Move]
solve m i o = fromJust $ dfs empty m i o

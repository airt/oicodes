-- https://www.codewars.com/kata/escape-the-mines-or-die

module EscapeTheMinesOrDie where

import Control.Arrow (first, second)
import Data.Function (on)
import Data.List (minimumBy)
import Data.Maybe (catMaybes)
import Data.Set (Set, empty, insert, member)

type XY = (Int, Int)

data Move = U | D | L | R
  deriving (Eq, Show)

(!?) :: [a] -> Int -> Maybe a
__ !? n | n < 0 = Nothing
[] !? _ = Nothing
(x : __) !? 0 = Just x
(_ : xs) !? n = xs !? pred n

(!!?) :: [[a]] -> XY -> Maybe a
xs !!? (i, j) = (!? j) =<< (!? i) xs

living :: [[Bool]] -> XY -> Bool
living m i = m !!? i == Just True

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

solve :: [[Bool]] -> XY -> XY -> Maybe [Move]
solve = dfs empty

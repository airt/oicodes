-- https://www.codewars.com/kata/reverse-polish-notation-calculator

module RPN where

import Data.Maybe (fromMaybe, listToMaybe)

data Exp a = Opr (a -> a -> a) | Val a

tokenize :: String -> Exp Double
tokenize "+" = Opr (+)
tokenize "-" = Opr (-)
tokenize "*" = Opr (*)
tokenize "/" = Opr (/)
tokenize nst = Val $ read nst

evaluate :: [Double] -> Exp Double -> [Double]
evaluate (x : y : zs) (Opr f) = f y x : zs
evaluate ns (Val n) = n : ns

calc :: String -> Double
calc = fromMaybe 0 . listToMaybe . foldl evaluate [] . map tokenize . words

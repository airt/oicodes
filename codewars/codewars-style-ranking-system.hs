-- https://www.codewars.com/kata/codewars-style-ranking-system

module CodewarRanking where

import Data.List (elemIndex)
import Data.Maybe (fromJust, fromMaybe)

newtype User = User { getPoints :: Int }
  deriving (Eq, Show)

(?!) :: [a] -> Int -> Maybe a
m ?! n | 0 <= n && n < length m = Just $ m !! n
_ ?! _ = Nothing

ranks :: [Int]
ranks = [-8, -7.. -1] ++ [1.. 8]

newUser :: User
newUser = User 0

rank :: User -> Int
rank (User points) = fromMaybe 8 $ ranks ?! div points 100

progress :: User -> Int
progress user | rank user == 8 = 0
progress (User points) = mod points 100

incProgress :: Int -> User -> User
incProgress completedRank (User points) = User $ points + incPoints d
  where
    d = fromJust (elemIndex completedRank ranks) - div points 100
    incPoints d | d < (-1) = 0
    incPoints (-1) = 1
    incPoints 0 = 3
    incPoints d = 10 * d * d

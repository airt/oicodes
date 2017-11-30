-- https://www.codewars.com/kata/sort-binary-tree-by-levels

module TreeByLevels where

import Data.Maybe (catMaybes, maybe)
import TreeByLevels.TreeNode

{-
data TreeNode a =
  TreeNode {
    left  :: Maybe (TreeNode a),
    right :: Maybe (TreeNode a),
    value :: a
  }
  deriving Show
-}

children :: TreeNode a -> [TreeNode a]
children (TreeNode l r _) = catMaybes [l, r]

bft :: [TreeNode a] -> [a]
bft [] = []
bft nodes = (value <$> nodes) ++ bft (children =<< nodes)

treeByLevels :: Maybe (TreeNode a) -> [a]
treeByLevels = maybe [] (bft . return)

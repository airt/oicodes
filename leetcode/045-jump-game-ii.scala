// https://leetcode.com/problems/jump-game-ii

object Solution {

  def jump(ns: Array[Int]): Int = {
    val ms = ns.zipWithIndex map { case (x, i) => x + i }
    def h(i: Int, j: Int, r: Int = 0): Int =
      if (ns.length <= j) r else h(j, (ms view (i, j)).max + 1, r + 1)
    h(0, 1)
  }

}

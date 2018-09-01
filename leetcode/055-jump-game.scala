// https://leetcode.com/problems/jump-game

object Solution {

  def canJump(ns: Array[Int]): Boolean = {
    val ms = ns.zipWithIndex map { case (x, i) => x + i }
    def h(i: Int, j: Int): Boolean = {
      val m = (ms view (i, j)).max + 1
      ns.length <= j || (j < m && h(j, m))
    }
    h(0, 1)
  }

}

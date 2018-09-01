// https://leetcode.com/problems/container-with-most-water

object Solution {

  def maxArea(heights: Array[Int]): Int = {
    def h(i: Int, j: Int, max: Int = 0): Int =
      if (i == j) max else
      if (heights(i) < heights(j))
        h(i + 1, j, max max (heights(i) * (j - i)))
      else
        h(i, j - 1, max max (heights(j) * (j - i)))
    h(0, heights.length - 1)
  }

}

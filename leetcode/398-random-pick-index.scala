// https://leetcode.com/problems/random-pick-index

class Solution(numbers: Array[Int]) {

  import scala.util.Random

  def pick(target: Int): Int = {
    def randomOneNth(n: Int): Boolean = (Random nextInt n) == 0
    def h(n: Int, index: Int, z: Int): Int =
      if (index == numbers.length) z
      else if (numbers(index) != target) h(n, index + 1, z)
      else h(n + 1, index + 1, if (randomOneNth(n)) index else z)
    h(1, 0, 0)
  }

}

/**
 * Your Solution object will be instantiated and called as such:
 * var o = new Solution(numbers)
 * var r = o.pick(target)
 */

// https://leetcode.com/problems/reverse-integer

object Solution {

  def reverse(x: Int): Int = {
    def h(x: Int, r: Int): Int = {
      val t = r * 10 + x % 10
      if (x == 0) r else
      if (r != t / 10) 0
      else h(x / 10, t)
    }
    (math signum x) * h(math abs x, 0)
  }

}

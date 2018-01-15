// https://leetcode.com/problems/palindrome-number

object Solution {

  def isPalindrome(x: Int): Boolean = {
    def h(x: Int, y: Int): Boolean =
      if (x == y || x / 10 == y) true else
      if (x < y) false
      else h(x / 10, x % 10 + y * 10)
    if (x < 0 || (x != 0 && x % 10 == 0)) false
    else h(x, 0)
  }

}

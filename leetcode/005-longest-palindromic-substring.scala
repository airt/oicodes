// https://leetcode.com/problems/longest-palindromic-substring

object Solution {

  def longestPalindrome(s: String): String = {
    if (s.isEmpty) return s
    def expand: ((Int, Int)) => (Int, Int) = { case (i, j) =>
      if (0 <= i && j <= s.length && s(i) == s(j - 1)) expand(i - 1, j + 1) else (i + 1, j - 1)
    }
    def length: ((Int, Int)) => Int = { case (i, j) => j - i }
    val (i, j) = s.indices flatMap (i => Seq((i, i + 1), (i, i + 2))) map expand maxBy length
    s substring (i, j)
  }

}

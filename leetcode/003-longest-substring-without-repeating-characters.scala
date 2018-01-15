// https://leetcode.com/problems/longest-substring-without-repeating-characters

object Solution {

  def lengthOfLongestSubstring(string: String): Int = {
    def h(index: Int, length: Int, start: Int, memo: Map[Char, Int]): Int =
      if (index == string.length) length else {
        val char = string(index)
        val startN = math max (start, memo getOrElse (char, -1))
        val lengthN = math max (length, index - startN)
        h(index + 1, lengthN, startN, memo + (char -> index))
      }
    h(0, 0, -1, Map())
  }

}

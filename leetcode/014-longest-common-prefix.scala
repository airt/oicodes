// https://leetcode.com/problems/longest-common-prefix

object Solution {

  def longestCommonPrefix(strings: Array[String]): String =
    strings reduceOption commonPrefix getOrElse ""

  def commonPrefix(x: String, y: String): String =
    if (y startsWith x) x else commonPrefix(x.init, y)

}

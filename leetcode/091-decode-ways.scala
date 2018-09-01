// https://leetcode.com/problems/decode-ways

object Solution {

  def numDecodings(s: String): Int = {
    def valid1(i: Int) = s(i) != '0'
    def valid2(i: Int) = i + 1 < s.length && (10 to 26 contains (s(i).asDigit * 10 + s(i + 1).asDigit))
    val memo = new Array[Int](s.length)
    for (i <- s.indices.reverse)
      memo(i) =
        (if (valid1(i)) (memo lift (i + 1) getOrElse 1) else 0) +
        (if (valid2(i)) (memo lift (i + 2) getOrElse 1) else 0)
    memo.head
  }

}

// https://leetcode.com/problems/string-to-integer-atoi

object Solution {

  def myAtoi(string: String): Int = {
    val start = string indexWhere (_ != ' ')
    if (start < 0) 0 else {
      val (index, sign) = string(start) match {
        case '-' => (start + 1, -1)
        case '+' => (start + 1, 1)
        case _ => (start, 1)
      }
      def h(index: Int, z: Int): Int = {
        lazy val char = string(index)
        lazy val digit = char.asDigit
        def overflow = (Int.MaxValue - digit) / 10 < z
        if (index == string.length || !char.isDigit) sign * z else
        if (overflow) (if (sign < 0) Int.MinValue else Int.MaxValue)
        else h(index + 1, z * 10 + digit)
      }
      h(index, 0)
    }
  }

}

// https://leetcode.com/problems/integer-to-roman

object Solution {

  def intToRoman(n: Int): String = {
    val t = Array(
      Array("", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"),
      Array("", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"),
      Array("", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"),
      Array("", "M", "MM", "MMM")
    )
    t(3)(n / 1000) + t(2)((n % 1000) / 100) + t(1)((n % 100) / 10) + t(0)(n % 10)
  }

}

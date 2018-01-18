// https://leetcode.com/problems/roman-to-integer

object Solution {

  def romanToInt(s: String): Int = {
    val t = Map(
      'I' -> 1,
      'V' -> 5,
      'X' -> 10,
      'L' -> 50,
      'C' -> 100,
      'D' -> 500,
      'M' -> 1000
    )
    val xs = s map t
    xs zipAll (xs.tail, 0, 0) map { case (x, nx) => if (x < nx) -x else x } sum
  }

}

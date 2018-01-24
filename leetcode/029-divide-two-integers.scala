// https://leetcode.com/problems/divide-two-integers

object Solution {

  def divide(dividend: Int, divisor: Int): Int = {
    @inline def abs(x: Int) = if (x == Int.MinValue) Int.MaxValue else math abs x
    @inline def nbs(x: Int) = if (x == Int.MinValue) Int.MinValue else -(math abs x)
    @inline def dec(x: Int) = if (x == Int.MinValue) x else x - 1
    def h(x: Int, y: Int, z: Int): Int = if (x > y) z else h(x - y, y, dec(z))
    val sign: Int => Int = if ((math signum dividend) == (math signum divisor)) abs else nbs
    sign(h(nbs(dividend), nbs(divisor), 0))
  }

}

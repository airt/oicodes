// https://leetcode.com/problems/powx-n

object Solution {

  def myPow(x: Double, n: Int): Double =
    if (n < 0) 1 / h(x, -n) else h(x, n)

  def h(x: Double, n: Int, z: Double = 1): Double =
    if (n == 0) z else h(x * x, n / 2, if (n % 2 == 0) z else z * x)

}

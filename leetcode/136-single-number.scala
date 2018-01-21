// https://leetcode.com/problems/single-number

object Solution {

  def singleNumber(numbers: Array[Int]): Int =
    numbers reduce xor

  def xor: (Int, Int) => Int = _ ^ _

}

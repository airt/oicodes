// https://leetcode.com/problems/missing-number

object Solution {

  def missingNumber(numbers: Array[Int]): Int =
    (numbers.length + 1) * numbers.length / 2 - numbers.sum

}

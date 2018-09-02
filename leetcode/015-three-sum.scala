// https://leetcode.com/problems/3sum

object Solution {

  def threeSum(xs: Array[Int]): List[List[Int]] = {
    util.Sorting quickSort xs
    val results = collection.mutable.ArrayBuffer[List[Int]]()
    for (i <- xs.indices if 0 == i || xs(i - 1) != xs(i)) {
      var i1 = i + 1
      var i2 = xs.length - 1
      while (i1 < i2) {
        val sum = xs(i) + xs(i1) + xs(i2)
        if (sum == 0) {
          results += List(xs(i), xs(i1), xs(i2))
        }
        if (sum < 0) i1 += 1 else i2 -= 1
      }
    }
    results.distinct.toList
  }

}

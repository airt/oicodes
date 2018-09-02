// https://leetcode.com/problems/4sum

object Solution {

  def fourSum(xs: Array[Int], target: Int): List[List[Int]] = {
    util.Sorting quickSort xs
    val results = collection.mutable.ArrayBuffer[List[Int]]()
    for (i0 <- xs.indices; i3 <- i0 until xs.length) {
      var i1 = i0 + 1
      var i2 = i3 - 1
      while (i1 < i2) {
        val sum = xs(i0) + xs(i1) + xs(i2) + xs(i3)
        if (sum == target) {
          results += List(xs(i0), xs(i1), xs(i2), xs(i3))
        }
        if (sum < target) i1 += 1 else i2 -= 1
      }
    }
    results.distinct.toList
  }

}

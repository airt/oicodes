// https://leetcode.com/problems/3sum

object Solution {

  def threeSum(xs: Array[Int]): List[List[Int]] = {
    util.Sorting quickSort xs
    val rs = collection.mutable.ArrayBuffer[List[Int]]()
    for (i <- xs.indices if 0 == i || xs(i - 1) != xs(i)) {
      var i1 = i + 1
      var i2 = xs.length - 1
      while (i1 < i2) {
        val sum = xs(i) + xs(i1) + xs(i2)
        if (sum < 0) i1 += 1 else
        if (sum > 0) i2 -= 1 else {
          val r = List(xs(i), xs(i1), xs(i2))
          rs += r
          while (i1 < i2 && xs(i1) == r(1)) i1 += 1
          while (i1 < i2 && xs(i2) == r(2)) i2 -= 1
        }
      }
    }
    rs.toList
  }

}

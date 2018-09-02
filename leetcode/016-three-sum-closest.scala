// https://leetcode.com/problems/3sum-closest

object Solution {

  def threeSumClosest(xs: Array[Int], target: Int): Int = {
    util.Sorting quickSort xs
    var result = xs(0) + xs(1) + xs(2)
    for (i <- xs.indices) {
      var i1 = i + 1
      var i2 = xs.length - 1
      while (i1 < i2) {
        val sum = xs(i) + xs(i1) + xs(i2)
        if ((math abs (sum - target)) < (math abs (result - target))) {
          result = sum
        }
        if (sum < target) i1 += 1 else i2 -= 1
      }
    }
    result
  }

}

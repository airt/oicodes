// https://leetcode.com/problems/remove-duplicates-from-sorted-array

object Solution {

  def removeDuplicates(xs: Array[Int]): Int = {
    if (xs.isEmpty) return 0
    var i = 0
    for (x <- xs if x != xs(i)) {
      i += 1
      xs(i) = x
    }
    return i + 1
  }

}

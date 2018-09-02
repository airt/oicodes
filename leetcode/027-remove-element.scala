// https://leetcode.com/problems/remove-element

object Solution {

  def removeElement(xs: Array[Int], t: Int): Int = {
    if (xs.isEmpty) return 0
    var i = 0
    for (x <- xs if x != t) {
      xs(i) = x
      i += 1
    }
    return i
  }

}

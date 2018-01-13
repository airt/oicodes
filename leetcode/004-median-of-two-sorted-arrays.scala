// https://leetcode.com/problems/median-of-two-sorted-arrays

object Solution {

  def findMedianSortedArrays(xs: Array[Int], ys: Array[Int]): Double =
    // ensure length of xs <= length of ys
    if (xs.length <= ys.length) median(xs, ys) else median(ys, xs)

  /**
    *           left part          |             right part
    * xs(0), xs(1), .., xs(ix - 1) | xs(ix), xs(ix + 1), .., xs(len - 1)
    * ys(0), ys(1), .., ys(iy - 1) | ys(iy), ys(iy + 1), .., ys(len - 1)
    *
    *  length of left part ==  length of right part
    * maximum of left part <= minimum of right part
    */
  def median(xs: Array[Int], ys: Array[Int]): Double = {
    def found(ix: Int, iy: Int) = {
      def maxleft =
        if (ix == 0) ys(iy - 1) else
        if (iy == 0) xs(ix - 1)
        else math max (xs(ix - 1), ys(iy - 1))
      def minright =
        if (ix == xs.length) ys(iy) else
        if (iy == ys.length) xs(ix)
        else math min (xs(ix), ys(iy))
      if ((xs.length + ys.length) % 2 == 1) maxleft
      else (maxleft + minright) / 2.0
    }
    def h(minix: Int, maxix: Int): Double = {
      val ix = (minix + maxix) / 2
      val iy = (xs.length + ys.length + 1) / 2 - ix
      val m = xs.length
      if (ix < m && xs(ix) < ys(iy - 1)) h(ix + 1, maxix) else
      if (0 < ix && ys(iy) < xs(ix - 1)) h(minix, ix - 1)
      else found(ix, iy)
    }
    h(0, xs.length)
  }

}

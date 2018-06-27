// https://leetcode.com/problems/search-for-a-range

object Solution {

  def searchRange(xs: Array[Int], t: Int): Array[Int] = {
    Array(lowerBound(xs, t), upperBound(xs, t))
  }

  def lowerBound(xs: Array[Int], t: Int): Int = {
    def h(ix: Int, iz: Int): Int = {
      if (ix == iz) {
        val i = ix
        if (0 <= i && i < xs.length && xs(i) == t) i else -1
      } else {
        val iy = (ix + iz) / 2
        if (t <= xs(iy)) h(ix, iy) else h(iy + 1, iz)
      }
    }
    h(0, xs.length)
  }

  def upperBound(xs: Array[Int], t: Int): Int = {
    def h(ix: Int, iz: Int): Int = {
      if (ix == iz) {
        val i = ix - 1
        if (0 <= i && i < xs.length && xs(i) == t) i else -1
      } else {
        val iy = (ix + iz) / 2
        if (t < xs(iy)) h(ix, iy) else h(iy + 1, iz)
      }
    }
    h(0, xs.length)
  }

}

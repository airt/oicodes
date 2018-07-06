// https://leetcode.com/problems/trapping-rain-water

object Solution {

  def trap(heights: Array[Int]): Int = {
    def h(ix: Int, iz: Int, mx: Int = 0, mz: Int = 0, c: Int = 0): Int = {
      if (ix >= iz) c else {
        if (heights(ix) < heights(iz)) {
          val mmx = mx max heights(ix)
          h(ix + 1, iz, mmx, mz, c + (mmx - heights(ix)))
        } else {
          val mmz = mz max heights(iz)
          h(ix, iz - 1, mx, mmz, c + (mmz - heights(iz)))
        }
      }
    }
    h(0, heights.length - 1)
  }

}

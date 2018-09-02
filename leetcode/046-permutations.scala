// https://leetcode.com/problems/permutations

object Solution {

  def permute(xs: Array[Int]): List[List[Int]] = {
    def swap(i: Int, j: Int) = if (i != j) {
      xs(i) ^= xs(j)
      xs(j) ^= xs(i)
      xs(i) ^= xs(j)
    }
    val results = collection.mutable.ArrayBuffer[List[Int]]()
    def h(i: Int) {
      if (i == xs.length - 1) {
        results += xs.toList
      } else {
        for (j <- i until xs.length) {
          swap(i, j)
          h(i + 1)
          swap(i, j)
        }
      }
    }
    h(0)
    results.toList
  }

}

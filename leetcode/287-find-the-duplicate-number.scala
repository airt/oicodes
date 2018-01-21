// https://leetcode.com/problems/find-the-duplicate-number

object Solution {

  def findDuplicate(numbers: Array[Int]): Int = {
    def next = numbers
    def race(x: Int, y: Int): Int =
      if (x == y) next(x) else race(next(x), next(next(y)))
    def walk(x: Int, y: Int): Int =
      if (x == y) x else walk(next(x), next(y))
    val head = numbers(0)
    val intersection = race(head, next(head))
    walk(head, intersection)
  }

}

// https://leetcode.com/problems/count-and-say

object Solution {

  def countAndSay(n: Int): String = {
    val cass = (Iterator iterate List(1))(next)
    cass drop (n - 1) next () mkString ""
  }

  def next: List[Int] => List[Int] = {
    case Nil => Nil
    case x :: xs =>
      val (ts, ys) = xs span (x == _)
      val xc = ts.length + 1
      xc :: x :: next(ys)
  }

}

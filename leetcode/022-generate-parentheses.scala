// https://leetcode.com/problems/generate-parentheses

object Solution {

  def generateParenthesis(n: Int): List[String] =
    memoizedY[Int, Seq[String]](f => {
      case 0 => Seq("")
      case n =>
        for {
          i <- 0 until n
          x <- f(i)
          y <- f(n - 1 - i)
        } yield s"($x)$y"
    })(n).toList

  def memoizedY[A, B](f: (A => B) => A => B): A => B = {
    val m = collection.mutable.WeakHashMap[A, B]()
    def h(x: A) = m getOrElseUpdate (x, y(f)(x))
    def y(f: (A => B) => A => B): A => B = f(h)(_)
    y(f)
  }

}

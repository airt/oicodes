// https://leetcode.com/problems/zigzag-conversion

object Solution {

  def convert(s: String, nrows: Int): String = {
    if (nrows == 1) return s
    def h(cs: List[Char], step: Int, row: Int, rows: Array[StringBuilder]): String =
      cs match {
        case Nil => rows map (_ mkString "") mkString ""
        case c :: cs =>
          val nstep = if (row == 0 || row == nrows - 1) -step else step
          rows(row) += c
          h(cs, nstep, row + nstep, rows)
      }
    h(s.toList, -1, 0, (Array fill nrows)(new StringBuilder))
  }

}

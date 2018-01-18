// https://leetcode.com/problems/letter-combinations-of-a-phone-number

object Solution {

  def letterCombinations(digits: String): List[String] = {
    val letters = Vector("", "", "abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz") map (_.toList)
    def h: List[Int] => List[List[Char]] = {
      case Nil => Nil :: Nil
      case x :: xs =>
        for {
          c <- letters(x)
          cs <- h(xs)
        } yield c :: cs
    }
    if (digits.isEmpty) Nil
    else h(digits.toList map (_.asDigit)) map (_.mkString)
  }

}

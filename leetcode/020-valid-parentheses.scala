// https://leetcode.com/problems/valid-parentheses

object Solution {

  def isValid(string: String): Boolean = {
    def h(chars: List[Char], stack: List[Char]): Boolean = (chars, stack) match {
      case (Nil, Nil)             => true
      case ('(' :: cs, ts)        => h(cs, '(' :: ts)
      case ('[' :: cs, ts)        => h(cs, '[' :: ts)
      case ('{' :: cs, ts)        => h(cs, '{' :: ts)
      case (')' :: cs, '(' :: ts) => h(cs, ts)
      case (']' :: cs, '[' :: ts) => h(cs, ts)
      case ('}' :: cs, '{' :: ts) => h(cs, ts)
      case (')' :: _, _)          => false
      case (']' :: _, _)          => false
      case ('}' :: _, _)          => false
      case (_ :: cs, ts)          => h(cs, ts)
      case _                      => false
    }
    h(string.toList, Nil)
  }

}

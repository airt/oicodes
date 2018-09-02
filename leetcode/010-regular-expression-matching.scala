// https://leetcode.com/problems/regular-expression-matching

object Solution {

  def isMatch(string: String, pattern: String): Boolean = {
    def match1(c: Char, p: Char) = c == p || p == '.'
    def h: ((List[Char], List[Char])) => Boolean = {
      case (Nil, Nil)                                => true
      case (cs, p :: '*' :: ps) if h(cs, ps)         => true
      case (c :: cs, p :: '*' :: ps) if match1(c, p) => h(cs, p :: '*' :: ps)
      case (c :: cs, p :: ps) if match1(c, p)        => h(cs, ps)
      case _                                         => false
    }
    h((string.toList, pattern.toList))
  }

}

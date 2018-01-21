// https://leetcode.com/problems/integer-to-english-words

object Solution {

  def numberToWords(n: Int): String =
    if (n == 0) primitives(0) else arbitraryDigits(n) mkString " "

  def arbitraryDigits(n: Int, t: Int = 1): List[String] =
    if (n == 0) Nil else
    if (n < 1000) doubleOrThreeDigits(n) ::: (if (t == 1) Nil else primitives(t) :: Nil)
    else arbitraryDigits(n / 1000, t * 1000) ::: arbitraryDigits(n % 1000, t)

  def doubleOrThreeDigits(n: Int) =
    if (n < 100) doubleDigits(n) else threeDigits(n)

  def threeDigits(n: Int) =
    primitives(n / 100) :: primitives(100) :: doubleDigits(n % 100)

  def doubleDigits(n: Int) =
    if (n == 0) Nil
    else primitives get n map (_ :: Nil) getOrElse { primitives(n / 10 * 10) :: primitives(n % 10) :: Nil }

  import collection.immutable.IntMap

  val primitives = IntMap(
    0 -> "Zero",
    1 -> "One",
    2 -> "Two",
    3 -> "Three",
    4 -> "Four",
    5 -> "Five",
    6 -> "Six",
    7 -> "Seven",
    8 -> "Eight",
    9 -> "Nine",
    10 -> "Ten",
    11 -> "Eleven",
    12 -> "Twelve",
    13 -> "Thirteen",
    14 -> "Fourteen",
    15 -> "Fifteen",
    16 -> "Sixteen",
    17 -> "Seventeen",
    18 -> "Eighteen",
    19 -> "Nineteen",
    20 -> "Twenty",
    30 -> "Thirty",
    40 -> "Forty",
    50 -> "Fifty",
    60 -> "Sixty",
    70 -> "Seventy",
    80 -> "Eighty",
    90 -> "Ninety",
    100 -> "Hundred",
    1000 -> "Thousand",
    1000000 -> "Million",
    1000000000 -> "Billion"
  )

}

// https://leetcode.com/problems/add-two-numbers

/**
  * class ListNode(
  *   var x: Int = 0,
  *   var next: ListNode = null
  * )
  */

object Solution {

  def addTwoNumbers(xs: ListNode, ys: ListNode): ListNode =
    if (xs eq null) ys else if (ys eq null) xs else {
      val n = xs.x + ys.x
      val ns = addTwoNumbers(xs.next, ys.next)
      if (n < 10) cons(n)(ns) else cons(n % 10)(addTwoNumbers(ns, new ListNode(1)))
    }

  def cons(x: Int) = (xs: ListNode) => {
    val n = new ListNode(x)
    n.next = xs
    n
  }

}

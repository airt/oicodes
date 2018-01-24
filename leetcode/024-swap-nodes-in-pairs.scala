// https://leetcode.com/problems/swap-nodes-in-pairs

/**
  * class ListNode(
  *   var x: Int = 0,
  *   var next: ListNode = null
  * )
  */

object Solution {

  def swapPairs(xs: ListNode): ListNode =
    reverseKGroup(xs, 2, identity)

  def reverseKGroup(xs: ListNode, n: Int, k: ListNode => ListNode): ListNode =
    cut(xs, n, identity) match {
      case None => k(xs)
      case Some((hk, ts)) => reverseKGroup(ts, n, k compose hk)
    }

  def cut(xs: ListNode, n: Int, k: ListNode => ListNode): Option[(ListNode => ListNode, ListNode)] =
    if (n == 0) Some((k, xs)) else
    if (xs eq null) None
    else cut(xs.next, n - 1, cons(xs.x) compose k)

  def cons(x: Int) = (xs: ListNode) => {
    val n = new ListNode(x)
    n.next = xs
    n
  }

}

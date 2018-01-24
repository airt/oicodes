// https://leetcode.com/problems/merge-two-sorted-lists

/**
  * class ListNode(
  *   var x: Int = 0,
  *   var next: ListNode = null
  * )
  */

object Solution {

  def mergeTwoLists(xs: ListNode, ys: ListNode): ListNode = merge(xs, ys, identity)

  def merge(xs: ListNode, ys: ListNode, k: ListNode => ListNode): ListNode =
    if (xs eq null) k(ys) else
    if (ys eq null) k(xs) else
    if (xs.x < ys.x)
      merge(xs.next, ys, k compose cons(xs.x))
    else
      merge(xs, ys.next, k compose cons(ys.x))

  def cons(x: Int) = (xs: ListNode) => {
    val n = new ListNode(x)
    n.next = xs
    n
  }

}

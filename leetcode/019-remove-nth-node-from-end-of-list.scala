// https://leetcode.com/problems/remove-nth-node-from-end-of-list

/**
  * class ListNode(
  *   var x: Int = 0,
  *   var next: ListNode = null
  * )
  */

object Solution {

  def removeNthFromEnd(xs: ListNode, n: Int): ListNode = {
    val ts = cons(0)(xs)
    detachNext(walkToEnd(ts, step(ts, n + 1)))
    ts.next
  }

  def detachNext(xs: ListNode): Unit =
    xs.next = xs.next.next

  def walkToEnd(xs: ListNode, ys: ListNode): ListNode =
    if (ys eq null) xs else walkToEnd(xs.next, ys.next)

  def step(xs: ListNode, n: Int): ListNode =
    if (n == 0) xs else step(xs.next, n - 1)

  def cons(x: Int) = (xs: ListNode) => {
    val n = new ListNode(x)
    n.next = xs
    n
  }

}

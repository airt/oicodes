// https://leetcode.com/problems/linked-list-random-node

/**
 * Definition for singly-linked list.
 * class ListNode(
 *   var x: Int = 0,
 *   var next: ListNode = null
 * )
 */

/**
 * @param head The linked list's head.
 * Note that the head is guaranteed to be not null, so it contains at least one node.
 */
class Solution(head: ListNode) {

  import scala.util.Random

  /** Returns a random node's value. */
  def getRandom(): Int = {
    def randomOneNth(n: Int): Boolean = (Random nextInt n) == 0
    def h(n: Int, node: ListNode, z: Int): Int =
      if (node == null) z
      else h(n + 1, node.next, if (randomOneNth(n)) node.x else z)
    h(1, head, 0)
  }

}

/**
 * Your Solution object will be instantiated and called as such:
 * var o = new Solution(head)
 * var r = o.getRandom()
 */

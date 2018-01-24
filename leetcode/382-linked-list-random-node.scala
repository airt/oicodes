// https://leetcode.com/problems/linked-list-random-node

/**
  * class ListNode(
  *   var x: Int = 0,
  *   var next: ListNode = null
  * )
  */

class Solution(head: ListNode) {

  import scala.util.Random

  def getRandom(): Int = {
    def randomOneNth(n: Int): Boolean = (Random nextInt n) == 0
    def h(n: Int, node: ListNode, z: Int): Int =
      if (node eq null) z
      else h(n + 1, node.next, if (randomOneNth(n)) node.x else z)
    h(1, head, 0)
  }

}

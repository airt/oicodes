# https://leetcode.com/problems/linked-list-random-node

# pylint: disable=I0011, C0103, C0111

import random

# Definition for singly-linked list.
# class ListNode:
#   def __init__(self, x):
#     self.val = x
#     self.next = None

class Solution:

  def __init__(self, head):
    """
    @param head The linked list's head.
    Note that the head is guaranteed to be not null, so it contains at least one node.
    :type head: ListNode
    """
    self.head = head

  def getRandom(self):
    """
    Returns a random node's value.
    :rtype: int
    """
    def random_one_nth(n):
      return random.randint(1, n) == 1
    i = 1
    n = self.head
    v = self.head.val
    while n.next:
      i += 1
      n = n.next
      if random_one_nth(i):
        v = n.val
    return v

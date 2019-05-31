/*
 * @lc app=leetcode id=21 lang=rust
 *
 * [21] Merge Two Sorted Lists
 */

// @lc code=start
// Definition for singly-linked list.
// #[derive(PartialEq, Eq, Clone, Debug)]
// pub struct ListNode {
//   pub val: i32,
//   pub next: Option<Box<ListNode>>
// }
//
// impl ListNode {
//   #[inline]
//   fn new(val: i32) -> Self {
//     ListNode {
//       next: None,
//       val
//     }
//   }
// }
impl Solution {
    pub fn merge_two_lists(
        x: Option<Box<ListNode>>,
        y: Option<Box<ListNode>>,
    ) -> Option<Box<ListNode>> {
        match (x, y) {
            (None, None) => None,
            (None, Some(y)) => Some(y),
            (Some(x), None) => Some(x),
            (Some(mut x), Some(mut y)) => {
                let (x, y, mut h) = if x.val < y.val {
                    (x.next.take(), Some(y), x)
                } else {
                    (Some(x), y.next.take(), y)
                };
                h.next = Self::merge_two_lists(x, y);
                Some(h)
            }
        }
    }
}
// @lc code=end

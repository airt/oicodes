/*
 * @lc app=leetcode id=2 lang=rust
 *
 * [2] Add Two Numbers
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
    pub fn add_two_numbers(
        x: Option<Box<ListNode>>,
        y: Option<Box<ListNode>>,
    ) -> Option<Box<ListNode>> {
        match (x, y) {
            (None, None) => None,
            (None, Some(y)) => Some(y),
            (Some(x), None) => Some(x),
            (Some(x), Some(y)) => {
                let mut v = x.val + y.val;
                let mut n = Self::add_two_numbers(x.next, y.next);
                if v >= 10 {
                    v -= 10;
                    n = Self::add_two_numbers(n, Some(Box::new(ListNode::new(1))));
                }
                Some(Box::new(ListNode { val: v, next: n }))
            }
        }
    }
}
// @lc code=end

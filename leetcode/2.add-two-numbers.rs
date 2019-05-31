/*
 * @lc app=leetcode id=2 lang=rust
 *
 * [2] Add Two Numbers
 */

#[derive(Clone, Debug, Eq, PartialEq)]
pub struct ListNode {
  pub val: i32,
  pub next: Option<Box<ListNode>>,
}

impl ListNode {
  pub fn new(val: i32) -> Self {
    ListNode { val, next: None }
  }
}

pub struct Solution;

// @lc code=start
impl Solution {
  pub fn add_two_numbers(
    x: Option<Box<ListNode>>,
    y: Option<Box<ListNode>>,
  ) -> Option<Box<ListNode>> {
    match (x, y) {
      (Some(x), Some(y)) => {
        let mut v = x.val + y.val;
        let mut n = Self::add_two_numbers(x.next, y.next);
        if v >= 10 {
          v -= 10;
          n = Self::add_two_numbers(n, Some(Box::new(ListNode::new(1))));
        }
        Some(Box::new(ListNode { val: v, next: n }))
      }
      (x, y) => x.or(y),
    }
  }
}
// @lc code=end

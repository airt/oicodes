/*
 * @lc app=leetcode id=21 lang=rust
 *
 * [21] Merge Two Sorted Lists
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
  pub fn merge_two_lists(
    x: Option<Box<ListNode>>,
    y: Option<Box<ListNode>>,
  ) -> Option<Box<ListNode>> {
    match (x, y) {
      (Some(mut x), Some(mut y)) => {
        let (x, y, mut z) = if x.val <= y.val {
          (x.next.take(), Some(y), x)
        } else {
          (Some(x), y.next.take(), y)
        };
        z.next = Self::merge_two_lists(x, y);
        Some(z)
      }
      (x, y) => x.or(y),
    }
  }
}
// @lc code=end

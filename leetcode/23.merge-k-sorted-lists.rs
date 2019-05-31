/*
 * @lc app=leetcode id=23 lang=rust
 *
 * [23] Merge k Sorted Lists
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
  pub fn merge_k_lists(xs: Vec<Option<Box<ListNode>>>) -> Option<Box<ListNode>> {
    use std::collections::BinaryHeap;
    let mut xs = BinaryHeap::from(xs);
    let xs = std::iter::from_fn(|| {
      let mut x = xs.pop()??;
      xs.push(x.next.take());
      Some(x)
    });
    let mut h = ListNode::new(Default::default());
    let mut p = &mut h;
    for x in xs {
      p.next = Some(x);
      p = p.next.as_mut()?;
    }
    h.next
  }
}

impl PartialOrd for ListNode {
  fn partial_cmp(&self, r: &Self) -> Option<std::cmp::Ordering> {
    self.val.partial_cmp(&r.val).map(|x| x.reverse())
  }
}

impl Ord for ListNode {
  fn cmp(&self, r: &Self) -> std::cmp::Ordering {
    self.val.cmp(&r.val).reverse()
  }
}
// @lc code=end

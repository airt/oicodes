/*
 * @lc app=leetcode id=19 lang=rust
 *
 * [19] Remove Nth Node From End of List
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
    pub fn remove_nth_from_end(mut x: Option<Box<ListNode>>, n: i32) -> Option<Box<ListNode>> {
        unsafe {
            let mut p = &mut x as *mut Option<Box<ListNode>>;
            let mut t = &mut x as *mut Option<Box<ListNode>>;
            for _ in 0..n {
                p = &mut (*p).as_mut()?.next;
            }
            while (*p).is_some() {
                p = &mut (*p).as_mut()?.next;
                t = &mut (*t).as_mut()?.next;
            }
            (*t) = (*t).as_mut()?.next.take();
        }
        x
    }
}
// @lc code=end

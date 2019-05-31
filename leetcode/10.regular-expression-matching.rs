/*
 * @lc app=leetcode id=10 lang=rust
 *
 * [10] Regular Expression Matching
 */

pub struct Solution;

// @lc code=start
impl Solution {
  pub fn is_match(s: String, p: String) -> bool {
    fn h(s: &[u8], p: &[u8]) -> bool {
      match (s, p) {
        ([], []) => true,
        ([..], [_, b'*', ..]) if h(s, &p[2..]) => true,
        ([x, ..], [z, b'*', ..]) if x == z || z == &b'.' => h(&s[1..], p),
        ([x, ..], [z, ..]) if x == z || z == &b'.' => h(&s[1..], &p[1..]),
        ([..], [..]) => false,
      }
    }
    h(s.as_bytes(), p.as_bytes())
  }
}
// @lc code=end

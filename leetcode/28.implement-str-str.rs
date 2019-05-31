/*
 * @lc app=leetcode id=28 lang=rust
 *
 * [28] Implement strStr()
 */

pub struct Solution;

// @lc code=start
impl Solution {
  pub fn str_str(x: String, y: String) -> i32 {
    if y.is_empty() {
      0
    } else {
      x.as_bytes()
        .windows(y.len())
        .position(|s| s == y.as_bytes())
        .map_or(-1, |i| i as i32)
    }
  }
}
// @lc code=end

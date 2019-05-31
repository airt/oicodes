/*
 * @lc app=leetcode id=28 lang=rust
 *
 * [28] Implement strStr()
 */

pub struct Solution;

// @lc code=start
impl Solution {
  pub fn str_str(x: String, y: String) -> i32 {
    let x = x.as_bytes();
    let y = y.as_bytes();
    if y.is_empty() {
      0
    } else {
      let i = x.windows(y.len()).position(|x| x == y);
      i.map_or(-1, |i| i as i32)
    }
  }
}
// @lc code=end

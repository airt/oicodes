/*
 * @lc app=leetcode id=7 lang=rust
 *
 * [7] Reverse Integer
 */

pub struct Solution;

// @lc code=start
impl Solution {
  pub fn reverse(x: i32) -> i32 {
    let h = || {
      let mut x = x;
      let mut z = 0;
      while x != 0 {
        z = 10i32.checked_mul(z)?.checked_add(x % 10)?;
        x /= 10;
      }
      Some(z)
    };
    h().unwrap_or_default()
  }
}
// @lc code=end

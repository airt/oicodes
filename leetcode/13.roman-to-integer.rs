/*
 * @lc app=leetcode id=13 lang=rust
 *
 * [13] Roman to Integer
 */

pub struct Solution;

// @lc code=start
impl Solution {
  pub fn roman_to_int(s: String) -> i32 {
    s.bytes().rfold(0, |z, c| {
      z + match c {
        b'I' if z >= 5 => -1,
        b'I' => 1,
        b'V' => 5,
        b'X' if z >= 50 => -10,
        b'X' => 10,
        b'L' => 50,
        b'C' if z >= 500 => -100,
        b'C' => 100,
        b'D' => 500,
        b'M' => 1000,
        _ => 0,
      }
    })
  }
}
// @lc code=end

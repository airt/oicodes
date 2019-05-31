/*
 * @lc app=leetcode id=16 lang=rust
 *
 * [16] 3Sum Closest
 */

pub struct Solution;

// @lc code=start
impl Solution {
  pub fn three_sum_closest(mut xs: Vec<i32>, z: i32) -> i32 {
    let mut r = i32::MAX;
    xs.sort_unstable();
    for i in 0..xs.len() {
      let mut i1 = i + 1;
      let mut i2 = xs.len() - 1;
      while i1 < i2 {
        let s = xs[i] + xs[i1] + xs[i2];
        if (s - z).abs() < (r - z).abs() {
          r = s;
        }
        if s <= z {
          i1 += 1;
        } else {
          i2 -= 1;
        }
      }
    }
    r
  }
}
// @lc code=end

/*
 * @lc app=leetcode id=6 lang=rust
 *
 * [6] ZigZag Conversion
 */

pub struct Solution;

// @lc code=start
impl Solution {
  pub fn convert(s: String, n: i32) -> String {
    let xs = (0..n).chain((1..n - 1).rev()).cycle();
    let mut xs = xs.zip(s.bytes()).collect::<Vec<_>>();
    xs.sort_by_key(|&(i, _)| i);
    xs.into_iter().map(|(_, x)| x as char).collect()
  }
}
// @lc code=end

/*
 * @lc app=leetcode id=14 lang=rust
 *
 * [14] Longest Common Prefix
 */

pub struct Solution;

// @lc code=start
impl Solution {
  pub fn longest_common_prefix(s: Vec<String>) -> String {
    let s = s.into_iter().reduce(|x, y| {
      let z = x.bytes().zip(y.bytes()).take_while(|(x, y)| x == y);
      z.map(|(x, _)| x as char).collect()
    });
    s.unwrap_or_default()
  }
}
// @lc code=end

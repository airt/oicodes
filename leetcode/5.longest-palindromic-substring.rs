/*
 * @lc app=leetcode id=5 lang=rust
 *
 * [5] Longest Palindromic Substring
 */

pub struct Solution;

// @lc code=start
impl Solution {
  pub fn longest_palindrome(s: String) -> String {
    let mut s = (0..s.len()).rev().flat_map(|x| s.as_bytes().windows(x + 1));
    let s = s.find(|s| s.iter().rev().eq(s.iter()));
    let s = s.map(|s| s.iter().map(|&x| x as char).collect());
    s.unwrap_or_default()
  }
}
// @lc code=end

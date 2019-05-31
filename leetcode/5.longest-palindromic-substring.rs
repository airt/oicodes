/*
 * @lc app=leetcode id=5 lang=rust
 *
 * [5] Longest Palindromic Substring
 */

// @lc code=start
impl Solution {
    pub fn longest_palindrome(s: String) -> String {
        (1..=s.len())
            .rev()
            .flat_map(|n| s.as_bytes().windows(n))
            .filter(|s| s.iter().rev().eq(s.iter()))
            .next()
            .and_then(|s| String::from_utf8(s.to_vec()).ok())
            .unwrap_or_default()
    }
}
// @lc code=end

/*
 * @lc app=leetcode id=5 lang=rust
 *
 * [5] Longest Palindromic Substring
 */

// @lc code=start
impl Solution {
    pub fn longest_palindrome(s: String) -> String {
        let h = || {
            let mut c = (0..s.len()).rev().flat_map(|n| s.as_bytes().windows(n + 1));
            let s = c.find(|s| s.iter().rev().eq(s.iter()))?;
            String::from_utf8(s.to_vec()).ok()
        };
        h().unwrap_or_default()
    }
}
// @lc code=end

/*
 * @lc app=leetcode id=9 lang=rust
 *
 * [9] Palindrome Number
 */

// @lc code=start
impl Solution {
    pub fn is_palindrome(x: i32) -> bool {
        let c = (x as f64).log10() as u32;
        let s = (0..=c).map(|b| x / 10i32.pow(b) % 10);
        x >= 0 && s.clone().rev().eq(s)
    }
}
// @lc code=end

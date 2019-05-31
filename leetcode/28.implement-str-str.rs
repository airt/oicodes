/*
 * @lc app=leetcode id=28 lang=rust
 *
 * [28] Implement strStr()
 */

// @lc code=start
impl Solution {
    pub fn str_str(x: String, y: String) -> i32 {
        if y.is_empty() {
            return 0;
        }
        x.as_bytes()
            .windows(y.len())
            .position(|s| s == y.as_bytes())
            .map(|i| i as i32)
            .unwrap_or(-1)
    }
}
// @lc code=end

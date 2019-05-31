/*
 * @lc app=leetcode id=6 lang=rust
 *
 * [6] ZigZag Conversion
 */

// @lc code=start
impl Solution {
    pub fn convert(s: String, n: i32) -> String {
        let xs = (0..n).chain((1..n - 1).rev()).cycle();
        let mut zs = xs.zip(s.chars()).collect::<Vec<_>>();
        zs.sort_by_key(|t| t.0);
        zs.into_iter().map(|t| t.1).collect()
    }
}
// @lc code=end

/*
 * @lc app=leetcode id=14 lang=rust
 *
 * [14] Longest Common Prefix
 */

// @lc code=start
impl Solution {
    pub fn longest_common_prefix(ss: Vec<String>) -> String {
        ss.iter()
            .fold(ss.first().cloned().unwrap_or_default(), |z, x| {
                z.chars()
                    .zip(x.chars())
                    .take_while(|(z, x)| z == x)
                    .map(|(z, _)| z)
                    .collect()
            })
    }
}
// @lc code=end

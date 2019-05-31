/*
 * @lc app=leetcode id=3 lang=rust
 *
 * [3] Longest Substring Without Repeating Characters
 */

// @lc code=start
impl Solution {
    pub fn length_of_longest_substring(s: String) -> i32 {
        use std::collections::HashMap;
        let mut m = HashMap::new();
        let mut b = -1;
        let mut l = 0;
        for (i, x) in s.bytes().enumerate() {
            let i = i as i32;
            if let Some(v) = m.insert(x, i) {
                b = b.max(v);
            }
            l = l.max(i - b);
        }
        l
    }
}
// @lc code=end

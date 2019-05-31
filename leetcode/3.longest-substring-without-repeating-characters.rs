/*
 * @lc app=leetcode id=3 lang=rust
 *
 * [3] Longest Substring Without Repeating Characters
 */

// @lc code=start
impl Solution {
    pub fn length_of_longest_substring(s: String) -> i32 {
        use std::collections::hash_map::Entry;
        use std::collections::HashMap;
        let mut m = HashMap::new();
        let mut b = -1;
        let mut l = 0;
        for (i, c) in s.chars().enumerate() {
            if let Some(v) = m.insert(c, i as i32) {
                b = b.max(v);
            }
            l = l.max(i as i32 - b);
        }
        l
    }
}
// @lc code=end

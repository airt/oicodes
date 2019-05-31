/*
 * @lc app=leetcode id=1 lang=rust
 *
 * [1] Two Sum
 */

// @lc code=start
impl Solution {
    pub fn two_sum(xs: Vec<i32>, t: i32) -> Vec<i32> {
        use std::collections::HashMap;
        let mut m = HashMap::new();
        for (i, x) in xs.iter().enumerate() {
            if let Some(&j) = m.get(&(t - x)) {
                return vec![j as i32, i as i32];
            }
            m.insert(x, i);
        }
        unreachable!();
    }
}
// @lc code=end

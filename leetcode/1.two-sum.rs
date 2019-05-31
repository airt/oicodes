/*
 * @lc app=leetcode id=1 lang=rust
 *
 * [1] Two Sum
 */

// @lc code=start
impl Solution {
    pub fn two_sum(xs: Vec<i32>, z: i32) -> Vec<i32> {
        use std::collections::HashMap;
        let mut m = HashMap::new();
        for (i, x) in xs.into_iter().enumerate() {
            let i = i as i32;
            if let Some(&j) = m.get(&(z - x)) {
                return vec![j, i];
            }
            m.insert(x, i);
        }
        unreachable!();
    }
}
// @lc code=end

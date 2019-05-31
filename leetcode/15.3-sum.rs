/*
 * @lc app=leetcode id=15 lang=rust
 *
 * [15] 3Sum
 */

// @lc code=start
impl Solution {
    pub fn three_sum(mut xs: Vec<i32>) -> Vec<Vec<i32>> {
        use std::collections::HashSet;
        let mut rs = HashSet::new();
        xs.sort_unstable();
        for i in 0..xs.len() {
            let mut i1 = i + 1;
            let mut i2 = xs.len() - 1;
            while i1 < i2 {
                let r = vec![xs[i], xs[i1], xs[i2]];
                let s = r.iter().sum::<i32>();
                if s == 0 {
                    rs.insert(r);
                }
                if s <= 0 {
                    i1 += 1;
                } else {
                    i2 -= 1;
                }
            }
        }
        rs.into_iter().collect()
    }
}
// @lc code=end

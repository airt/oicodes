/*
 * @lc app=leetcode id=15 lang=rust
 *
 * [15] 3Sum
 */

// @lc code=start
impl Solution {
    pub fn three_sum(mut xs: Vec<i32>) -> Vec<Vec<i32>> {
        let mut rs = vec![];
        xs.sort_unstable();
        for i in 0..xs.len() {
            if i > 0 && xs[i] == xs[i - 1] {
                continue;
            }
            let mut i1 = i + 1;
            let mut i2 = xs.len() - 1;
            while i1 < i2 {
                if i1 > i + 1 && xs[i1] == xs[i1 - 1] {
                    i1 += 1;
                    continue;
                }
                if i2 < xs.len() - 1 && xs[i2] == xs[i2 + 1] {
                    i2 -= 1;
                    continue;
                }
                let m = xs[i] + xs[i1] + xs[i2];
                if m == 0 {
                    rs.push(vec![xs[i], xs[i1], xs[i2]]);
                }
                if m <= 0 {
                    i1 += 1;
                } else {
                    i2 -= 1;
                }
            }
        }
        rs
    }
}
// @lc code=end

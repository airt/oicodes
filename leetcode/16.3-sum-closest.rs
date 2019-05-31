/*
 * @lc app=leetcode id=16 lang=rust
 *
 * [16] 3Sum Closest
 */

// @lc code=start
impl Solution {
    pub fn three_sum_closest(mut xs: Vec<i32>, t: i32) -> i32 {
        let mut r = std::i32::MAX;
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
                if (m - t).abs() < (r - t).abs() {
                    r = m;
                }
                if m <= t {
                    i1 += 1;
                } else {
                    i2 -= 1;
                }
            }
        }
        r
    }
}
// @lc code=end

/*
 * @lc app=leetcode id=11 lang=rust
 *
 * [11] Container With Most Water
 */

// @lc code=start
impl Solution {
    pub fn max_area(xs: Vec<i32>) -> i32 {
        let mut m = 0;
        let mut i = 0;
        let mut j = xs.len() - 1;
        while i < j {
            if (xs[i] < xs[j]) {
                m = m.max(xs[i] * (j - i) as i32);
                i += 1;
            } else {
                m = m.max(xs[j] * (j - i) as i32);
                j -= 1;
            }
        }
        m
    }
}
// @lc code=end

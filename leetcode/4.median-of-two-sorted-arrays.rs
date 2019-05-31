/*
 * @lc app=leetcode id=4 lang=rust
 *
 * [4] Median of Two Sorted Arrays
 */

// @lc code=start
impl Solution {
    pub fn find_median_sorted_arrays(xs: Vec<i32>, ys: Vec<i32>) -> f64 {
        let l = xs.len() + ys.len();
        let mut xs = xs.into_iter().rev().peekable();
        let mut ys = ys.into_iter().rev().peekable();
        let mut zs = std::iter::from_fn(|| {
            if xs.peek() >= ys.peek() {
                xs.next()
            } else {
                ys.next()
            }
        });
        if l % 2 == 0 {
            zs.skip(l / 2 - 1).take(2).sum::<i32>() as f64 / 2.0
        } else {
            zs.skip(l / 2).take(1).sum::<i32>() as f64
        }
    }
}
// @lc code=end

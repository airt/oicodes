/*
 * @lc app=leetcode id=4 lang=rust
 *
 * [4] Median of Two Sorted Arrays
 */

// @lc code=start
impl Solution {
    pub fn find_median_sorted_arrays(xs: Vec<i32>, ys: Vec<i32>) -> f64 {
        let l = xs.len() + ys.len();
        let mut xs = xs.into_iter().peekable();
        let mut ys = ys.into_iter().peekable();
        let mut zs = std::iter::from_fn(|| match (xs.peek(), ys.peek()) {
            (Some(x), yo) if yo.map_or(true, |y| x <= y) => xs.next(),
            (xo, Some(y)) if xo.map_or(true, |x| y <= x) => ys.next(),
            _ => None,
        });
        if l % 2 == 0 {
            zs.skip(l / 2 - 1).take(2).sum::<i32>() as f64 / 2.0
        } else {
            zs.skip(l / 2).take(1).sum::<i32>() as f64
        }
    }
}
// @lc code=end

/*
 * @lc app=leetcode id=7 lang=rust
 *
 * [7] Reverse Integer
 */

// @lc code=start
impl Solution {
    pub fn reverse(x: i32) -> i32 {
        let h = || {
            let mut x = x;
            let mut z = 0i32;
            while x != 0 {
                z = z.checked_mul(10)?.checked_add(x % 10)?;
                x = x / 10;
            }
            Some(z)
        };
        h().unwrap_or_default()
    }
}
// @lc code=end

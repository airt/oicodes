/*
 * @lc app=leetcode id=12 lang=rust
 *
 * [12] Integer to Roman
 */

// @lc code=start
impl Solution {
    pub fn int_to_roman(n: i32) -> String {
        let n = n as usize;
        let m: &[&[&str]] = &[
            &["", "M", "MM", "MMM"],
            &["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"],
            &["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"],
            &["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"],
        ];
        let s = &[
            m[0][n / 1000],
            m[1][n % 1000 / 100],
            m[2][n % 100 / 10],
            m[3][n % 10],
        ];
        s.concat()
    }
}
// @lc code=end

/*
 * @lc app=leetcode id=12 lang=rust
 *
 * [12] Integer to Roman
 */

// @lc code=start
impl Solution {
    pub fn int_to_roman(n: i32) -> String {
        let m = [
            "", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX", "", "X", "XX", "XXX", "XL",
            "L", "LX", "LXX", "LXXX", "XC", "", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC",
            "CM", "", "M", "MM", "MMM",
        ];
        let r = [
            m[n as usize % 10000 / 1000 + 30],
            m[n as usize % 1000 / 100 + 20],
            m[n as usize % 100 / 10 + 10],
            m[n as usize % 10],
        ];
        r.concat()
    }
}
// @lc code=end

/*
 * @lc app=leetcode id=13 lang=rust
 *
 * [13] Roman to Integer
 */

// @lc code=start
impl Solution {
    pub fn roman_to_int(s: String) -> i32 {
        s.chars().rfold(0, |z, c| {
            z + match c {
                'I' if z >= 5 => -1,
                'I' => 1,
                'V' => 5,
                'X' if z >= 50 => -10,
                'X' => 10,
                'L' => 50,
                'C' if z >= 500 => -100,
                'C' => 100,
                'D' => 500,
                'M' => 1000,
                _ => 0,
            }
        })
    }
}
// @lc code=end

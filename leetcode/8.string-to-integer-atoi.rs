/*
 * @lc app=leetcode id=8 lang=rust
 *
 * [8] String to Integer (atoi)
 */

// @lc code=start
impl Solution {
    pub fn my_atoi(s: String) -> i32 {
        let mut n: i32 = 0;
        let mut p: i32 = 0;
        for c in s.trim_start().chars() {
            match c {
                '+' if p == 0 => p = 1,
                '-' if p == 0 => p = -1,
                '0'..='9' => {
                    p = if p == 0 { 1 } else { p };
                    let h = || n.checked_mul(10)?.checked_add(c as i32 - '0' as i32);
                    if let Some(x) = h() {
                        n = x
                    } else {
                        return if p < 0 { std::i32::MIN } else { std::i32::MAX };
                    }
                }
                _ => break,
            }
        }
        n * p
    }
}
// @lc code=end

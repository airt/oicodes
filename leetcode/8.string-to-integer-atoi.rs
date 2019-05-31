/*
 * @lc app=leetcode id=8 lang=rust
 *
 * [8] String to Integer (atoi)
 */

// @lc code=start
impl Solution {
    pub fn my_atoi(s: String) -> i32 {
        let mut s = s.trim_start().bytes().peekable();
        let p = s
            .peek()
            .cloned()
            .filter(|b| [0x2b, 0x2d].contains(b))
            .and_then(|_| s.next())
            .map_or(1, |b| 0x2c - b as i32);
        s.take_while(|b| (0x30..0x3a).contains(b))
            .try_fold(0i32, |z, b| z.checked_mul(10)?.checked_add(b as i32 - 0x30))
            .and_then(|n| n.checked_mul(p))
            .unwrap_or(if p < 0 { std::i32::MIN } else { std::i32::MAX })
    }
}
// @lc code=end

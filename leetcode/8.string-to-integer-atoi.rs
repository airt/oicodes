/*
 * @lc app=leetcode id=8 lang=rust
 *
 * [8] String to Integer (atoi)
 */

pub struct Solution;

// @lc code=start
impl Solution {
  pub fn my_atoi(s: String) -> i32 {
    let b = |x| [b'+', b'-'].contains(&x).then(|| b',' as i32 - x as i32);
    let d = |x| (b'0'..b':').contains(&x).then(|| x as i32 - b'0' as i32);
    let f = |z, x| 10i32.checked_mul(z)?.checked_add(x);
    let s = s.trim_start();
    let p = s.bytes().next().and_then(b);
    let s = s.bytes().skip(p.map_or(0, |_| 1));
    let p = p.unwrap_or(1);
    let n = s.map_while(d).try_fold(0, f);
    let n = n.and_then(|n| n.checked_mul(p));
    n.unwrap_or(if p < 0 { i32::MIN } else { i32::MAX })
  }
}
// @lc code=end

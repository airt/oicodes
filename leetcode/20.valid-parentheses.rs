/*
 * @lc app=leetcode id=20 lang=rust
 *
 * [20] Valid Parentheses
 */

pub struct Solution;

// @lc code=start
impl Solution {
  pub fn is_valid(s: String) -> bool {
    use std::collections::HashMap;
    let m = HashMap::from([(b'(', b')'), (b'[', b']'), (b'{', b'}')]);
    let mut t = vec![];
    for x in s.bytes().rev() {
      match m.get(&x) {
        Some(v) if Some(v) != t.pop().as_ref() => return false,
        None => t.push(x),
        _ => (),
      }
    }
    t.is_empty()
  }
}
// @lc code=end

/*
 * @lc app=leetcode id=20 lang=rust
 *
 * [20] Valid Parentheses
 */

// @lc code=start
impl Solution {
    pub fn is_valid(s: String) -> bool {
        use std::collections::HashMap;
        let p = HashMap::from([('(', ')'), ('[', ']'), ('{', '}')]);
        let mut m = vec![];
        for c in s.chars().rev() {
            match p.get(&c) {
                Some(v) if Some(v) == m.pop().as_ref() => (),
                Some(v) => return false,
                None => m.push(c),
            }
        }
        m.is_empty()
    }
}
// @lc code=end

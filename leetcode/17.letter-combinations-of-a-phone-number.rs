/*
 * @lc app=leetcode id=17 lang=rust
 *
 * [17] Letter Combinations of a Phone Number
 */

pub struct Solution;

// @lc code=start
impl Solution {
  pub fn letter_combinations(s: String) -> Vec<String> {
    let m = [
      "", "", "abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz",
    ];
    let f = |z| move |c| format!("{}{}", z, c as char);
    if s.is_empty() {
      vec![]
    } else {
      let s = s.bytes().map(|x| x as usize - b'0' as usize);
      s.fold(vec![String::new()], |z, x| {
        z.into_iter().flat_map(|z| m[x].bytes().map(f(z))).collect()
      })
    }
  }
}
// @lc code=end

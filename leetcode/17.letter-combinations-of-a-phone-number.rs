/*
 * @lc app=leetcode id=17 lang=rust
 *
 * [17] Letter Combinations of a Phone Number
 */

// @lc code=start
impl Solution {
    pub fn letter_combinations(s: String) -> Vec<String> {
        let m = [
            "", "", "abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz",
        ];
        if s.is_empty() {
            vec![]
        } else {
            s.chars()
                .map(|c| c as usize - 0x30)
                .fold(vec!["".to_string()], |z, n| {
                    z.iter()
                        .flat_map(|z| m[n].chars().map(move |c| z.clone() + &c.to_string()))
                        .collect()
                })
        }
    }
}
// @lc code=end

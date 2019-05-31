/*
 * @lc app=leetcode id=10 lang=rust
 *
 * [10] Regular Expression Matching
 */

// @lc code=start
impl Solution {
    pub fn is_match(s: String, p: String) -> bool {
        fn h(s: &[u8], p: &[u8]) -> bool {
            if p.is_empty() {
                s.is_empty()
            } else {
                let match_single = !s.is_empty() && (p[0] == s[0] || p[0] == b'.');
                let has_wildcard = p.len() > 1 && p[1] == b'*';
                match (match_single, has_wildcard) {
                    (true, true) => h(&s[1..], p) || h(s, &p[2..]),
                    (true, false) => h(&s[1..], &p[1..]),
                    (false, true) => h(s, &p[2..]),
                    (false, false) => false,
                }
            }
        }
        h(s.as_bytes(), p.as_bytes())
    }
}
// @lc code=end

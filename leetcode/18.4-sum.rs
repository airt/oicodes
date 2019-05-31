/*
 * @lc app=leetcode id=18 lang=rust
 *
 * [18] 4Sum
 */

pub struct Solution;

// @lc code=start
impl Solution {
  pub fn four_sum(mut xs: Vec<i32>, z: i32) -> Vec<Vec<i32>> {
    use std::collections::HashSet;
    let mut rs = HashSet::new();
    xs.sort_unstable();
    for i in 0..xs.len() {
      for j in i + 1..xs.len() {
        let mut i1 = i + 1;
        let mut i2 = j - 1;
        while i1 < i2 {
          let r = vec![xs[i], xs[i1], xs[i2], xs[j]];
          let s = r.iter().map(|&x| x as i64).sum::<i64>();
          let z = z as i64;
          if s == z {
            rs.insert(r);
          }
          if s <= z {
            i1 += 1;
          } else {
            i2 -= 1;
          }
        }
      }
    }
    rs.into_iter().collect()
  }
}
// @lc code=end

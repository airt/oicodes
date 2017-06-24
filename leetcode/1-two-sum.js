// https://leetcode.com/problems/two-sum

/**
 * @param {number[]} xs
 * @param {number} t
 * @return {number[]}
 */
const twoSum = (xs, t) => {
  const memo = new Map()
  for (const [x, i] of xs.map((x, i) => [x, i])) {
    const yi = memo.get(t - x)
    if (yi !== undefined) {
      return [yi, i]
    }
    memo.set(x, i)
  }
}

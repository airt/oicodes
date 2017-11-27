// https://leetcode.com/problems/two-sum

/**
 * @param {Array<number>} xs
 * @param {number} t
 * @return {Array<number>}
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

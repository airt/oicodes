// https://leetcode.com/problems/two-sum

class Solution {
public:
  vector<int> twoSum(vector<int> &xs, int t) {
    unordered_map<int, int> memo;
    for (int i = 0; i < xs.size(); i += 1) {
      int x = xs[i];
      auto yi = memo.find(t - x);
      if (yi != memo.end()) {
        return {yi->second, i};
      }
      memo[x] = i;
    }
  }
};

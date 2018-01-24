// https://leetcode.com/problems/3sum

class Solution {
public:
  vector<vector<int>> threeSum(vector<int> &xs) {
    vector<vector<int>> rs;
    std::sort(xs.begin(), xs.end());
    for (int i = 0; i < xs.size(); i += 1) {
      if (0 < i && xs[i - 1] == xs[i]) continue;
      int i1 = i + 1;
      int i2 = xs.size() - 1;
      while (i1 < i2) {
        int sum = xs[i] + xs[i1] + xs[i2];
        if (sum < 0) i1 += 1; else
        if (sum > 0) i2 -= 1;
        else {
          vector<int> r = {xs[i], xs[i1], xs[i2]};
          rs.push_back(r);
          while (i1 < i2 && xs[i1] == r[1]) i1 += 1;
          while (i1 < i2 && xs[i2] == r[2]) i2 -= 1;
        }
      }
    }
    return rs;
  }
};

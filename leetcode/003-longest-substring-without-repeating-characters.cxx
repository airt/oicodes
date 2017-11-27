// https://leetcode.com/problems/longest-substring-without-repeating-characters

class Solution {
public:
  int lengthOfLongestSubstring(string s) {
    vector<int> memo(128, -1);
    int maxLength = 0;
    for (int start = -1, i = 0; i < s.length(); i += 1) {
      start = max(start, memo[s[i]]);
      memo[s[i]] = i;
      maxLength = max(maxLength, i - start);
    }
    return maxLength;
  }
};

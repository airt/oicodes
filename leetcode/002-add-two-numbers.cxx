// https://leetcode.com/problems/add-two-numbers

// struct ListNode {
//   int val;
//   ListNode *next;
//   ListNode(int x) : val(x), next(NULL) {}
// };

class Solution {
public:
  ListNode *addTwoNumbers(ListNode *xs, ListNode *ys) {
    if (xs != NULL and ys != NULL) {
      int mval = xs->val + ys->val;
      ListNode *next = calcNext(mval >= 10, addTwoNumbers(xs->next, ys->next));
      return cons(mval % 10, next);
    } else if (xs == NULL) {
      return ys;
    } else if (ys == NULL) {
      return xs;
    } else {
      return NULL;
    }
  }

  inline ListNode *calcNext(bool carry, ListNode *mnext) {
    if (carry) {
      return addTwoNumbers(mnext, new ListNode(1));
    } else {
      return mnext;
    }
  }

  inline ListNode *cons(int headVal, ListNode *tail) {
    ListNode *node = new ListNode(headVal);
    node->next = tail;
    return node;
  }
};

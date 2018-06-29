-- https://leetcode.com/problems/consecutive-numbers

select distinct l.num as consecutivenums
  from logs l, logs ll, logs lll
  where l.id + 1 = ll.id and ll.id + 1 = lll.id
    and l.num = ll.num and ll.num = lll.num

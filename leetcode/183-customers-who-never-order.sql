-- https://leetcode.com/problems/customers-who-never-order

select name as customers
  from customers
  where id not in (select customerid from orders)

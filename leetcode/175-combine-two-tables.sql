-- https://leetcode.com/problems/combine-two-tables

select firstname, lastname, city, state
  from person left join address on person.personid = address.personid

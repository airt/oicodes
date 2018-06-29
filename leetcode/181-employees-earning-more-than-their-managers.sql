-- https://leetcode.com/problems/employees-earning-more-than-their-managers

select employee.name as employee
  from employee, employee managers
  where employee.managerid = managers.id
    and employee.salary > managers.salary

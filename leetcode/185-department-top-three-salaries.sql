-- https://leetcode.com/problems/department-top-three-salaries

select department.name as department, employee.name as employee, employee.salary
  from employee join department on employee.departmentid = department.id
  where 3 > (select count(distinct t.salary) from employee t where t.departmentid = employee.departmentid and t.salary > employee.salary)

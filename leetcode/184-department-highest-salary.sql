-- https://leetcode.com/problems/department-highest-salary

select department.name as department, employee.name as employee, employee.salary
  from employee join department on employee.departmentid = department.id
  where (departmentid, salary) in (select departmentid, max(salary) from employee group by departmentid)

SELECT department, first_name, last_name, salary FROM (
SELECT department, first_name, last_name, salary,
   (SELECT max(salary) FROM employees e1 
   WHERE e1.department = e2.department) AS max_department_sal_employee,
   (SELECT min(salary) FROM employees e1 
   WHERE e1.department = e2.department) AS min_department_sal_employee
   FROM employees e2 
   ORDER BY department
   ) a
   WHERE salary = max_department_sal_employee
   OR salary = min_department_sal_employee
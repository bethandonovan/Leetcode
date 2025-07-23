# Write your MySQL query statement below
SELECT employee_id, department_id
FROM employee
WHERE primary_flag = 'Y'

UNION

SELECT employee_id, MIN(department_id) AS department_id
FROM employee
GROUP BY employee_id
HAVING COUNT(DISTINCT department_id) = 1;

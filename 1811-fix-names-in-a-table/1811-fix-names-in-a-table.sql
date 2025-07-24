# Write your MySQL query statement below
select 
user_id,
concat(Upper(left(name, 1)), lower(substr(name, 2)))
as name 
from users
order by user_id asc
# Write your MySQL query statement below
select distinct num as consecutivenums
from 
(select num,
 lag(num) over (order by id) as prev_num,
lead(num) over (order by id) as next_num 
from logs) as sub
where num = prev_num and num = next_num
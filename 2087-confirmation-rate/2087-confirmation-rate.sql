# Write your MySQL query statement below
select 
s.user_id,
ifnull(round(sum(c.action='confirmed')/count(c.action) ,2),0) as confirmation_rate
from signups as s
left join confirmations as c
on s.user_id = c.user_id
group by s.user_id

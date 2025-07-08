# Write your MySQL query statement below
select 
r.contest_id, 
round(count(r.user_id)/(select count(*) from users) , 4)*100 as percentage
from register as r 
group by contest_id
order by percentage desc, contest_id asc
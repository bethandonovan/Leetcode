# Write your MySQL query statement below
(select 
u.name as results 
from movierating as m 
left join users as u
on m.user_id = u.user_id
group by m.user_id
order by count(*) desc, u.name asc 
limit 1)

union all

(select 
mo.title as results 
from movierating as m 
left join movies as mo
on m.movie_id = mo.movie_id
where m.created_at > '2020-01-31' and m.created_at < '2020-03-01' 
group by m.movie_id
order by avg(m.rating) desc, mo.title asc
limit 1)
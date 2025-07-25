# Write your MySQL query statement below
select 
s.product_id,
s.year as first_year,
s.quantity,
s.price 
from sales as s
where (s.year, s.product_id) in (select min(year), product_id 
from sales
group by product_id)



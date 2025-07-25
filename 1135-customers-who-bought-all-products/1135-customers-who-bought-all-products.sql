 select customer_id from 
customer 
group by customer_id
having count(distinct product_key) =  (select count(distinct p.product_key)
from product as p) 
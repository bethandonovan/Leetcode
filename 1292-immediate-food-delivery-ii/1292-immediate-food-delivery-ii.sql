select 
round(count(*) / (select count(distinct customer_id) from delivery),4)*100 as immediate_percentage
from (
    select customer_id, min(order_date) as first_order_date
    from delivery 
    group by customer_id
) as first_orders
join delivery d
on d.customer_id = first_orders.customer_id
and d.order_date = first_orders.first_order_date
where d.order_date = d.customer_pref_delivery_date
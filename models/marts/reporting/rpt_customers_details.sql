with customer_details as (
    select * from {{ ref('dim_customers')}}
)
, order_details as (
    select * from {{ ref('fct_orders')}}
)
select  name
	, most_recent_order_date 
	, lifetime_value 
	, amount
	, order_date 
from customer_details as cd
left join order_details as od
on cd.customer_id = od.customer_id
where number_of_orders > 1
and lifetime_value <> 0
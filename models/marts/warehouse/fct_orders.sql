with orders as  (
    select * from {{ ref('stg_orders' )}}
),
payments as (
    select * from {{ ref('stg_payments') }}
),
final as (
    select
        payments.order_id
        , orders.customer_id
        , orders.order_date
        , sum(case when status = 'completed' then amount end) as amount
    from orders
    left join payments using (order_id)
    group by 
        payments.order_id
        , orders.customer_id
        , orders.order_date
)
select * from final
with payments as (

    select * from {{ ref('stg_payments') }}

),

payment_summary as (

    select
        payment_method,
        count(payment_id) as number_of_payments,
        sum(amount) as total_amount,
        avg(amount) as average_amount

    from payments

    group by payment_method

)

select * from payment_summary

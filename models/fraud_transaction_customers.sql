
with fraud_transactions_customers as(
    select 
        type,
        country,
        count(distinct PayerCustomer) as no_of_fraud_customers
    from 
        {{ ref("cleansed") }}
    where 
        isFraud=1
    group by 
        type,
        country
)

select * from fraud_transactions_customers
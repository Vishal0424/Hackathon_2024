{{
  config(
    materialized = "table"
  )
}}

with fraud_transactions as 
(
    select * from {{source('snowdbt','transactions_by_country')}}
)

select * from fraud_transactions


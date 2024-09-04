{{
  config(
    materialized = "table"
  )
}}
with transformed as (
 select 
    Step,
    Type,
    cast(amount as DECIMAL(12,2)) as TransactionAmount,
    nameOrig as PayerCustomer,
    oldbalanceOrig as PayerInitialBalance,
    newbalanceOrig as PayerFinalBalance,
    nameDest as RecipientCustomer,
    oldbalanceDest as RecipientInitialBalance,
    newbalanceDest as RecipientFinalBalance,
    isFraud,
    country
from {{ ref("transactions_from_source") }}
)

select * from transformed
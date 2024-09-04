{{
  config(
    materialized = "table"
  )
}}
with transformed_transactions
as(
    select
        *,
        TransactionAmount/nullif(PayerInitialBalance,0) as TransactiontoInitialBalaceRatio,
        PayerFinalBalance-PayerInitialBalance as PayerBalanceChange,
        RecipientFinalBalance-RecipientInitialBalance as RecipientBalanceChange 
    from {{ ref("cleansed") }}   
)

select * from transformed_transactions
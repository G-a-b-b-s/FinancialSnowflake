{{ config(materialized='table') }}

with transactions as (

    select * from {{ ref('stg_financial_transactions') }}

)

select
    t.transaction_id,
    t.customer_id,
    t.product_id,
    t.product_type,
    t.transaction_date,
    t.amount,
    case
      when t.amount > 100 then 'high_value'
      else 'normal'
    end as transaction_segment
from transactions t

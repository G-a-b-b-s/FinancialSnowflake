{{ config(materialized='table') }}

select
    customer_id,
    date_trunc('month', transaction_date) as month,
    count(distinct transaction_id) as transactions_count,
    sum(amount) as total_revenue,
    avg(amount) as avg_transaction_amount
from {{ ref('int_financial_transactions') }}
group by 1, 2

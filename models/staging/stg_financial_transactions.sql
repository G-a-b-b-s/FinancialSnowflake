{{ config(materialized='view') }}

select
    cast(TRANSACTION_ID as varchar) as transaction_id,
    cast(CUSTOMER_ID as varchar) as customer_id,
    cast(PRODUCT_ID as varchar) as product_id,
    upper(PRODUCT_TYPE) as product_type,
    cast(TRANSACTION_DATE as date) as transaction_date,
    cast(AMOUNT as number(38,2)) as amount
from {{ source('financial','transactions') }}

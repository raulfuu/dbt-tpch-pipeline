-- This test checks the staging layer to ensure no corrupted dates 
-- exist outside the expected 1992-1998 TPC-H active window.
-- It returns rows (fails) if an invalid date is found.

with validation as (
    select
        order_id,
        order_date
    from {{ ref('stg_tpch__orders') }}
    where 
        order_date < '1992-01-01' 
        or order_date > '1998-12-31'
)

select * from validation
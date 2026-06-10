
    
    

select
    customer_id as unique_field,
    count(*) as n_records

from TPCH_ANALYTICS.PUBLIC.stg_tpch__customer
where customer_id is not null
group by customer_id
having count(*) > 1



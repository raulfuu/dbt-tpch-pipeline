
    
    

select
    supplier_id as unique_field,
    count(*) as n_records

from TPCH_ANALYTICS.PUBLIC.stg_tpch__supplier
where supplier_id is not null
group by supplier_id
having count(*) > 1



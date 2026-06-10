
    
    

select
    nation_id as unique_field,
    count(*) as n_records

from TPCH_ANALYTICS.PUBLIC.stg_tpch__nation
where nation_id is not null
group by nation_id
having count(*) > 1



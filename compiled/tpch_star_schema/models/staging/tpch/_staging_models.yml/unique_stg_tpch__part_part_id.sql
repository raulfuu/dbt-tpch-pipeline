
    
    

select
    part_id as unique_field,
    count(*) as n_records

from TPCH_ANALYTICS.PUBLIC.stg_tpch__part
where part_id is not null
group by part_id
having count(*) > 1



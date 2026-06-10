
    
    

select
    market_segment as unique_field,
    count(*) as n_records

from TPCH_ANALYTICS.PUBLIC.segment_managers
where market_segment is not null
group by market_segment
having count(*) > 1



with source as (
    select * from snowflake_sample_data.tpch_sf1.region
),

renamed as (
    select
        r_regionkey as region_id,
        r_name as region_name,
        r_comment as comment

    from source
)

select * from renamed
with 

tests as (
    select * from TPCH_ANALYTICS.observability.int_model_test_summary 
    where resource_type in
    (
        'model'
        
    )
),

final as (

    select 
        *
    from tests
    where not(is_primary_key_tested)

)

select * from final



    

    
    

    

    


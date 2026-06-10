with

final as (

    

        (
            select
                cast('TPCH_ANALYTICS.observability.base_node_columns' as TEXT) as _dbt_source_relation,

                /* No columns from any of the relations.
                   This star is only output during dbt compile, and exists to keep SQLFluff happy. */
                

                
                    cast("NODE_UNIQUE_ID" as character varying(16777216)) as "NODE_UNIQUE_ID" ,
                    cast("NAME" as character varying(16777216)) as "NAME" ,
                    cast("DESCRIPTION" as character varying(16777216)) as "DESCRIPTION" ,
                    cast("DATA_TYPE" as character varying(16777216)) as "DATA_TYPE" ,
                    cast("CONSTRAINTS" as character varying(16777216)) as "CONSTRAINTS" ,
                    cast("HAS_NOT_NULL_CONSTRAINT" as BOOLEAN) as "HAS_NOT_NULL_CONSTRAINT" ,
                    cast("CONSTRAINTS_COUNT" as NUMBER(38,0)) as "CONSTRAINTS_COUNT" ,
                    cast("QUOTE" as character varying(16777216)) as "QUOTE" 

            from TPCH_ANALYTICS.observability.base_node_columns

            
        )

        union all
        

        (
            select
                cast('TPCH_ANALYTICS.observability.base_source_columns' as TEXT) as _dbt_source_relation,

                /* No columns from any of the relations.
                   This star is only output during dbt compile, and exists to keep SQLFluff happy. */
                

                
                    cast("NODE_UNIQUE_ID" as character varying(16777216)) as "NODE_UNIQUE_ID" ,
                    cast("NAME" as character varying(16777216)) as "NAME" ,
                    cast("DESCRIPTION" as character varying(16777216)) as "DESCRIPTION" ,
                    cast("DATA_TYPE" as character varying(16777216)) as "DATA_TYPE" ,
                    cast(null as character varying(16777216)) as "CONSTRAINTS" ,
                    cast(null as BOOLEAN) as "HAS_NOT_NULL_CONSTRAINT" ,
                    cast(null as NUMBER(38,0)) as "CONSTRAINTS_COUNT" ,
                    cast("QUOTE" as character varying(16777216)) as "QUOTE" 

            from TPCH_ANALYTICS.observability.base_source_columns

            
        )

        
)

select * from final
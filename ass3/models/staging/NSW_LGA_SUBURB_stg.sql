{{
    config(
        unique_key='SUBURB_NAME'
    )
}}

with

source  as (

    select * from {{ ref('NSW_LGA_SUBURB_snapshot') }}

),

renamed as (
    select
    LGA_NAME,SUBURB_NAME
        
        from source;
),

unknown as (
    select
        0 as LGA_CODE,
        'unknown' as brand_description,
        '1900-01-01'::timestamp  as dbt_valid_from,
        null::timestamp as dbt_valid_to

)
select * from unknown
union all
select * from renamed
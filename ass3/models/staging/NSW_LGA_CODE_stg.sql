{{
    config(
        unique_key='LGA_CODE'
    )
}}

with

source  as (

    select * from {{ ref('NSW_LGA_CODE_snapshot') }}

),

renamed as (
    select
    LGA_CODE, LGA_NAME
        
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
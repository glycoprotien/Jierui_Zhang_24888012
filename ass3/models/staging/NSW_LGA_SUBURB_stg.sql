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
)
select * from renamed
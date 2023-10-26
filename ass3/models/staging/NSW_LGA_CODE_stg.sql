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
)
select * from renamed
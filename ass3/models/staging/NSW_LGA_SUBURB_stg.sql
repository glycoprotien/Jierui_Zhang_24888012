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
    *
    from source
)
select * from renamed
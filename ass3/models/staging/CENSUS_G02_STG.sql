{{
    config(
        unique_key='LGA_CODE_2016'
    )
}}

with

source  as (

    select * from {{ ref('CENSUS_G02_snapshot') }}

),

renamed as (
    select
        *  from source
)
select * from renamed
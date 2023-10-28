{{
    config(
        unique_key='LGA_CODE'
    )
}}

with

source  as (

    select * from {{ ref('NSW_LGA_CODE_snapshot') }}

),


select * from source
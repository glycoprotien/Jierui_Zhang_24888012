{{
    config(
        unique_key='LGA_CODE'
    )
}}



select * from {{ ref('NSW_LGA_CODE_snapshot') }}
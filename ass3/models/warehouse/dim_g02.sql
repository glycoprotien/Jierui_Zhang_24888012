{{
    config(
        unique_key='LGA_CODE_2016'
    )
}}



select *
from {{ ref('CENSUS_G02_stg') }} 
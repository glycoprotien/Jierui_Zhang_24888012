{{
    config(
        unique_key='LGA_CODE'
    )
}}



select LGA_CODE, LGA_NAME 
from {{ ref('NSW_LGA_CODE_stg') }} 
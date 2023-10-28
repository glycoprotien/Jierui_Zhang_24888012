{{
    config(
        unique_key='LGA_CODE'
    )
}}



select LGA_NAME, SURBURB_NAME 
from {{ ref('NSW_LGA_SUBURB_stg') }} 
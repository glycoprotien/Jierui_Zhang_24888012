{{
    config(
        unique_key='LGA_CODE'
    )
}}


select
a.LGA_CODE, b.LGA_NAME, b.SUBURB_NAME
from 
{{ ref('NSW_LGA_CODE_stg') }} a

left join {{ ref('NSW_LGA_SUBURB_stg') }} b  on a.LGA_CODE = b.LGA_CODE
{{
    config(
        unique_key='LGA_CODE'
    )
}}

with check_dimensions as
(select
	
from {{ ref('NSW_LGA_CODE_stg') }})
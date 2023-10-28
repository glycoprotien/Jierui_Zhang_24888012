


select
a.LGA_CODE, b.LGA_NAME, a.SUBURB_NAME
from {{ ref('NSW_LGA_SUBURB_stg') }} a
left join {{ ref('NSW_LGA_CODE_stg') }} b on a.LGA_NAME = b.LGA_NAME



select LGA_NAME, SUBURB_NAME
from {{ ref('NSW_LGA_SUBURB_stg') }} 
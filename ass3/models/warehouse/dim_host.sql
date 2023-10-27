{{
    config(
        unique_key='LISTING_ID'
    )
}}



select cast(LISTING_ID AS DECIMAL), HOST_ID, HOST_NAME, HOST_IS_SUPERHOST, HOST_NEIGHBOURHOOD, HOST_SINCE
from {{ ref('listings_stg') }} 
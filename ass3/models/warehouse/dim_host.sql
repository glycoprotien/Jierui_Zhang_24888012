{{
    config(
        unique_key='LISTING_ID'
    )
}}



select LISTING_ID, HOST_ID, HOST_IS_SUPERHOST, HOST_NAME, HOST_NEIGHBOURHOOD
from {{ ref('listings_stg') }} 
{{
    config(
        unique_key='LISTING_ID'
    )
}}



select LISTING_ID, HOST_ID
from {{ ref('listings_stg') }} 
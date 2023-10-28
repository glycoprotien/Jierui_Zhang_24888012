{{
    config(
        unique_key='LISTING_ID'
    )
}}



select LISTING_ID, ROOM_TYPE
from {{ ref('listings_stg') }} 
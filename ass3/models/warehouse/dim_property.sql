{{
    config(
        unique_key='LISTING_ID'
    )
}}



select LISTING_ID, HOST_ID, PROPERTY_TYPE,ROOM_TYPE, HAS_AVAILABILITY
from {{ ref('listings_stg') }} 
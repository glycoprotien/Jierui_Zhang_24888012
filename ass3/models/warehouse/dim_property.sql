{{
    config(
        unique_key='LISTING_ID'
    )
}}



select LISTING_ID, PROPERTY_TYPE
from {{ ref('listings_stg') }} 
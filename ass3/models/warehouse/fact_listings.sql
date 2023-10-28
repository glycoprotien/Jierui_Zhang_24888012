{{
    config(
        unique_key='LISTING_ID'
    )
}}



select a.LISTING_ID, a.SCRAPED_DATE AS DATE, a.LISTING_NEIGHBOURHOOD, b.NSW_LGA_CODE_stg AS LISTING_NEIGHBOURHOOD_LGA_COED, a.HOST_ID, a.HOST_NAME, a.HOST_SINCE, 
a.HOST_IS_SUPERHOST, b.HOST_NEIGHBOURHOOD_LGA_CODE, c.HOST_NEIGHBOURHOOD_LGA_NAME,a.PROPERTY_TYPE, a.ROOM_TYPE, a.PRICE, a.ACCOMMODATES,
a.HAS_AVAILABILITY, a.AVAILABILITY_30, a.NUMBER_OF_REVIEWS, a.REVIEW_SCORES_RATING
from {{ ref('listings_stg') }} a left join {{ ref('NSW_LGA_CODE_stg') }} b WHERE a.LISTING_NEIGHBOURHOOD=b.LGA_NAME left join {{ ref('NSW_LGA_SUBURB_stg') }} c WHERE b.LGA_NAME = c.LGA_NAME
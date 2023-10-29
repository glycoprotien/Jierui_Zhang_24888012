{{
    config(
        unique_key='LISTING_ID'
    )
}}

with check_dimensions as
(select
    listing_id,
    SCRAPED_DATE,
    HOST_ID ,
    HOST_NAME ,
    HOST_SINCE,
    HOST_IS_SUPERHOST ,
    HOST_NEIGHBOURHOOD ,
    LISTING_NEIGHBOURHOOD ,
    PROPERTY_TYPE,
    ROOM_TYPE,
    ACCOMMODATES ,
    PRICE ,
    HAS_AVAILABILITY ,
    AVAILABILITY_30 ,
    REVIEW_SCORES_RATING, 
    NUMBER_OF_REVIEWS 
from {{ ref('listings_stg') }})

select 
    a.listing_id,
    a.SCRAPED_DATE,
    a.HOST_ID,
    a.HOST_NAME,
    a.HOST_SINCE,
    a.HOST_IS_SUPERHOST,
    a.HOST_NEIGHBOURHOOD,
    b.HOST_NEIGHBOURHOOD_lga_name,
    a.LISTING_NEIGHBOURHOOD,
    c.LISTING_NEIGHBOURHOOD_lga_code,
    a.PROPERTY_TYPE,
    a.ROOM_TYPE,
    a.ACCOMMODATES,
    a.PRICE,
    a.HAS_AVAILABILITY,
    a.AVAILABILITY_30,
    a.REVIEW_SCORES_RATING,
    a.NUMBER_OF_REVIEWS
from check_dimensions a 
left join {{ ref('NSW_LGA_CODE_stg') }} c on a.LISTING_NEIGHBOURHOOD = c. LISTING_NEIGHBOURHOOD_lga_code
left join {{ ref('NSW_LGA_SUBURB_stg') }} b on a.HOST_NEIGHBOURHOOD = b.HOST_NEIGHBOURHOOD_lga_name

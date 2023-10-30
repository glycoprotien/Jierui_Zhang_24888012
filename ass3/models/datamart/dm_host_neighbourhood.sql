WITH ActiveListings AS (
    SELECT 
        has_availability,
        host_neighbourhood_lga_name,
        price::NUMERIC,
        review_scores_rating,
        DATE_TRUNC('MONTH', scraped_date)::date AS monthyear,
        CAST(availability_30 AS INTEGER) AS availability_30,
        scraped_date, 
        host_id,
        host_is_superhost
    FROM {{ ref('fact_listings') }}  fl
)
SELECT 
    host_neighbourhood_lga_name, 
    monthyear,
    estimated_revenue,
     estimated_revenue/num_of_dis_host as estimated_revenue_per_host
FROM (
    SELECT 
        host_neighbourhood_lga_name, 
        monthyear,
        COUNT(DISTINCT host_id) AS num_of_dis_host,
        SUM(CASE WHEN has_availability = 't' 
            THEN (30 - availability_30) * price
            ELSE 0 
            END
        ) AS estimated_revenue
        from ActiveListings
        group by 
        host_neighbourhood_lga_name, 
        monthyear) as subquary
 order by  host_neighbourhood_lga_name, 
        monthyear     

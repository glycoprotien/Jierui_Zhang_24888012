WITH ActiveListings AS (
    SELECT 
        has_availability,
        price::NUMERIC,
        review_scores_rating,
        DATE_TRUNC('MONTH',scraped_date)::date as monthyear,
        CAST(availability_30 AS INTEGER) AS availability_30,
        scraped_date, 
        host_id,
        host_is_superhost,
        listing_neighbourhood
    FROM {{ ref('fact_listings') }}  fl
)
select   listing_neighbourhood, monthyear,active_listings_rate, min_price, max_price, median_price, avg_price, 
 distinct_hosts, superhost_rate, avg_review_scores_rating,
CASE WHEN LAG(active_listings) OVER (PARTITION BY listing_neighbourhood ORDER BY monthyear) = 0 THEN NULL
        ELSE (active_listings - LAG(active_listings) OVER (PARTITION BY listing_neighbourhood ORDER BY monthyear))::NUMERIC / lag(active_listings) OVER (PARTITION BY listing_neighbourhood ORDER BY monthyear)
    END AS percentage_active_listings_change,
CASE WHEN LAG(inactive_listings) OVER (PARTITION BY listing_neighbourhood ORDER BY monthyear) = 0 THEN NULL
        ELSE (inactive_listings - LAG(inactive_listings) OVER (PARTITION BY listing_neighbourhood ORDER BY monthyear))::NUMERIC / lag(inactive_listings) OVER (PARTITION BY listing_neighbourhood ORDER BY monthyear)
    END AS percentage_inactive_listings_change,  
    total_stays, estimated_revenue_per_active_listings
    from (SELECT listing_neighbourhood, monthyear,
    SUM(CASE WHEN has_availability = 't' THEN 1 ELSE 0 END) AS active_listings,
    SUM(CASE WHEN has_availability = 'f' THEN 1 ELSE 0 END) AS inactive_listings,   
	CASE 
    WHEN COUNT(*) > 0 THEN (COUNT(CASE WHEN has_availability = 't' THEN 1 ELSE NULL END) / COUNT(*)) * 100
    ELSE 0  
    END AS active_listings_rate,
    MIN(CASE WHEN has_availability = 't' THEN price ELSE NULL END) AS min_price,
    MAX(CASE WHEN has_availability = 't' THEN price ELSE NULL END) AS max_price,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY CASE WHEN has_availability = 't' THEN price END) AS median_price,
    AVG(CASE WHEN has_availability = 't' THEN price ELSE NULL END) AS avg_price,
    COUNT(DISTINCT host_id) AS distinct_hosts,
    (COUNT(DISTINCT CASE WHEN host_is_superhost = 't' THEN host_id ELSE NULL END) / COUNT(DISTINCT host_id)) * 100 AS superhost_rate,
    AVG(CASE WHEN has_availability = 't' THEN review_scores_rating ELSE NULL END) AS avg_review_scores_rating,
    SUM(CASE WHEN has_availability = 't' THEN (30 - availability_30) ELSE 0 END) AS total_stays,
    AVG(CASE WHEN has_availability = 't' THEN (30 - availability_30) * price ELSE NULL END) AS estimated_revenue_per_active_listings
FROM ActiveListings GROUP BY listing_neighbourhood, monthyear) AS subquery

ORDER BY listing_neighbourhood, monthyear
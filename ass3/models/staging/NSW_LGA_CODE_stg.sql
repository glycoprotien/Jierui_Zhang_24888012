{{
    config(
        unique_key='LGA_CODE'
    )
}}

with

source  as (

    select * from {{ ref('NSW_LGA_CODE_snapshot') }}

),

renamed as (
    select
        LGA_CODE,
        LGA_NAME,
        CASE
    WHEN EXTRACT(EPOCH FROM dbt_valid_from)::INT IS NULL THEN '1900-01-01'::TIMESTAMP
    ELSE dbt_valid_from
END AS dbt_valid_from,
    dbt_valid_to
    from source
),

unknown as (
    select
        0 as LGA_CODE,
        NULL as LGA_NAME 
        '1900-01-01'::timestamp as dbt_valid_from,
        null::timestamp as dbt_valid_to

)
select * from unknown
union all
select * from renamed
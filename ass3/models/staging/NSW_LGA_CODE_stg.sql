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
        CASE WHEN dbt_valid_from IS NULL then '1900-01-01'::timestamp else dbt_valid_from end as dbt_valid_from,
        dbt_valid_to
    from source
),

unknown as (
    select
        0 as LGA_CODE,
        '1900-01-01'::timestamp  as dbt_valid_from,
        null::timestamp as dbt_valid_to

)
select * from unknown
union all
select * from renamed
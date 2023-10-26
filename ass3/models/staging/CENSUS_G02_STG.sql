{{
    config(
        unique_key='LGA_CODE_2016'
    )
}}

with

source  as (

    select * from {{ ref('CENSUS_G02_snapshot') }}

),

renamed as (
    select
        LGA_CODE_2016, Median_age_persons,	Median_mortgage_repay_monthly,	
                    Median_tot_prsnl_inc_weekly,	Median_rent_weekly,	Median_tot_fam_inc_weekly,	
                    Average_num_psns_per_bedroom,	Median_tot_hhd_inc_weekly,	Average_household_size
    from source
)
select * from renamed
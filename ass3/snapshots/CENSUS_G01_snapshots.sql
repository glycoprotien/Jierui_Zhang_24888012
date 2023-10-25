{% snapshot CENSUS_G01_timestamp %}

    {{
        config(
          target_database='postgres'
          target_schema='RAW',
          strategy='timestamp',
          unique_key='LGA_CODE_2016',
          updated_at='updated_at',
        )
    }}

    select * from {{ source('RAW', 'CENSUS_G01') }}

{% endsnapshot %}
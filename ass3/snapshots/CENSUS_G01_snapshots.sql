{% snapshot CENSUS_G01_timestamp %}

    {{
        config(
          target_schema='RAW',
          strategy='timestamp',
          unique_key='id',
          updated_at='updated_at',
        )
    }}

    select * from {{ source('RAW', 'CENSUS_G01') }}

{% endsnapshot %}
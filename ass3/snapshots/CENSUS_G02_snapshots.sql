{% snapshot CENSUS_G02_timestamp %}
    {{
        config(
          target_database='postgres'
          target_schema='RAW',
          strategy='timestamp',
          unique_key='LGA_CODE_2016',
          updated_at='updated_at'
        )
    }}

    SELECT * FROM {{ source('RAW', 'CENSUS_G02') }}
{% endsnapshot %}

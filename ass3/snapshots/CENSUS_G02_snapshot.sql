{% snapshot CENSUS_G02_timestamp %}
    {{
        config(
          target_schema='RAW',
          strategy='timestamp',
          unique_key='LGA_CODE_2016',
          updated_at='updated_at'
        )
    }}

    SELECT * FROM {{ source('CENSUS_G02') }}
{% endsnapshot %}

{% snapshot NSW_LGA_SUBURB_timestamp %}

    {{
        config(
          target_schema='RAW',
          strategy='timestamp',
          unique_key='SUBURB_NAME',
          updated_at='updated_at'
        )
    }}

    select * from {{ source('RAW', 'NSW_LGA_SUBURB') }}

{% endsnapshot %}
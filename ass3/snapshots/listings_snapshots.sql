{% snapshot listings_timestamp %}

    {{
        config(
          target_schema='RAW',
          strategy='timestamp',
          unique_key='LISTING_ID',
          updated_at='updated_at',
        )
    }}

    select * from {{ source('RAW', 'listings') }}

{% endsnapshot %}
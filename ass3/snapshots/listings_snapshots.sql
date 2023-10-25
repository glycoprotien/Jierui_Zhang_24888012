{% snapshot listings_snapshots %}

{{
        config(
          target_schema='raw',
          strategy='timestamp',
          unique_key='LISTING_ID',
          updated_at: 'updated_at',
        )
    }}

select * from {{ source('raw', 'listings') }}

{% endsnapshot %}
{% snapshot NSW_LGA_SUBURB_snapshot %}

{{
        config(
          target_schema='RAW',
          strategy='timestamp',
          unique_key='SUBURB_NAME',
          updated_at='updated_at'
        )
}}

    select LGA_NAME,SUBURB_NAME from {{ source('RAW','NSW_LGA_SUBURB') }}

{% endsnapshot %}
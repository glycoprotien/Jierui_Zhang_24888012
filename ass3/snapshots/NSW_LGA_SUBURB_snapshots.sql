{% snapshot brand_snapshot %}

{{
        config(
          target_schema='raw',
          strategy='timestamp',
          unique_key='SUBURB_NAME',
          check_cols=['LGA_NAME',	'SUBURB_NAME'],
        )
    }}

select * from {{ source('raw', 'NSW_LGA_SUBURB') }}

{% endsnapshot %}
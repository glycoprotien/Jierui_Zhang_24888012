{% snapshot NSW_LGA_SUBURB_snapshots %}

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
{% snapshot brand_snapshot %}

{{
        config(
          target_schema='raw',
          strategy='check',
          unique_key='id',
          check_cols=['LGA_CODE', 'LGA_NAME'],
        )
    }}

select * from {{ source('raw', 'NSW_LGA_CODE') }}

{% endsnapshot %}
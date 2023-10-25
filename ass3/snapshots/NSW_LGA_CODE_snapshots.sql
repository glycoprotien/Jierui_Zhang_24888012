{% snapshot NSW_LGA_CODE_snapshots %}

{{
        config(
          target_schema='raw',
          strategy='timestamp',
          unique_key='LGA_CODE',
          check_cols=['LGA_CODE', 'LGA_NAME'],
        )
    }}

select * from {{ source('raw', 'NSW_LGA_CODE') }}

{% endsnapshot %}
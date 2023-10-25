{% snapshot NSW_LGA_CODE_snapshots %}

{{
        config(
          target_schema='raw',
          strategy='timestamp',
          unique_key='LGA_CODE',
          updated_at: 'updated_at',
        )
    }}

select * from {{ source('raw', 'NSW_LGA_CODE') }}

{% endsnapshot %}
{% snapshot NSW_LGA_CODE_timestamp %}

{{
        config(
          target_schema='RAW',
          strategy='timestamp',
          unique_key='LGA_CODE',
          updated_at='updated_at'
        )
}}

select LGA_CODE, LGA_NAME from {{ source('RAW','NSW_LGA_CODE') }}

{% endsnapshot %}
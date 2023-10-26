{% snapshot NSW_LGA_CODE_snapshot %}

{{
        config(
          target_schema='raw',
          strategy='timestamp',
          unique_key='LGA_CODE',
          updated_at='LGA_CODE'
        )
}}

select LGA_CODE, LGA_NAME from {{ source('raw','NSW_LGA_CODE') }}

{% endsnapshot %}
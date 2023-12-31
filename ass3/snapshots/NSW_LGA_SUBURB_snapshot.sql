{% snapshot NSW_LGA_SUBURB_snapshot %}

{{
        config(
          target_schema='raw',
          strategy='timestamp',
          unique_key='SUBURB_NAME',
          updated_at='SUBURB_NAME'
        )
}}

    select LGA_NAME,SUBURB_NAME from {{ source('raw','nsw_lga_suburb') }}

{% endsnapshot %}
{% snapshot CENSUS_G02_snapshots %}

{{
        config(
          target_schema='raw',
          strategy='timestamp',
          unique_key='LGA_CODE_2016',
          updated_at: 'updated_at',
        )
    }}

select * from {{ source('raw', 'CENSUS_G02') }}

{% endsnapshot %}
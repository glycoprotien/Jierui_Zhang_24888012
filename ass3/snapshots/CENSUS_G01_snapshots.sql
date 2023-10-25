{% snapshot CENSUS_G01_snapshots %}

{{
        config(
          target_schema='raw',
          strategy='timestamp',
          unique_key='LGA_CODE_2016',
          updated_at: 'updated_at',
        )
    }}

select * from {{ source('raw', 'CENSUS_G01') }}

{% endsnapshot %}
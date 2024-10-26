{% snapshot users_timestamp %}

    {{
        config(
            target_database='dbt',
            target_schema='snapshots',
            strategy='timestamp',
            unique_key='id',
            updated_at='updated_at',
        )
    }}

    select * from {{ source('public', 'users') }}

{% endsnapshot %}
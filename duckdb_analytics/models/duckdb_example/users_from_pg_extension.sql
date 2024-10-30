SELECT
    *
FROM
    postgres_scan(
        'host=localhost port=5432 dbname=dbt user=postgres password=postgres',
        'public',
        'users'
    )
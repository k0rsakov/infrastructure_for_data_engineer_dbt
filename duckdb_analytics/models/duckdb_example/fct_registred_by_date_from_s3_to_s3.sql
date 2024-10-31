{{ config(materialized='external', location='s3://prod/dm/fct_registred_date.gzip.parquet') }}
SELECT
	created_at::date AS registred_date,
	count(id) AS count
FROM
	{{ ref("users_from_s3_extension") }}
GROUP BY
	1
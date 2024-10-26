SELECT
	city,
	count(*)
FROM
	{{ ref('dbt_source_users') }}
GROUP BY
	1

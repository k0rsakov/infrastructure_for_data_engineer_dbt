SELECT
	created_at::date AS registred_date,
	count(id) AS count
FROM
	 {{ ref("users_from_pg_extension") }}
GROUP BY
	1
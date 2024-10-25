SELECT
	created_at::date AS registred_date,
	count(*)
FROM
	users AS u
GROUP BY
	1
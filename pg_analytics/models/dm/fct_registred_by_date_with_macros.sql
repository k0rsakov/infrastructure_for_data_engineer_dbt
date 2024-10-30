SELECT
    {{ cast_to_date('created_at') }} AS registred_date,
	count(*)
FROM
	users AS u
GROUP BY
	1
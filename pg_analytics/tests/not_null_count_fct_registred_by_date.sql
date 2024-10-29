SELECT
	*
FROM
	{{ ref('fct_registred_by_date') }}
WHERE
	"count" IS NULL
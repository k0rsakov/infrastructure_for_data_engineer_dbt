{{
    config(
        materialized='incremental',
        unique_key='registred_date'
    )
}}

SELECT
	created_at::date AS registred_date,
	count(*)
FROM
	users AS u

{% if is_incremental() %}

  WHERE created_at >= (SELECT coalesce(max(registred_date), '1900-01-01') FROM {{ this }})

{% endif %}

GROUP BY
	1
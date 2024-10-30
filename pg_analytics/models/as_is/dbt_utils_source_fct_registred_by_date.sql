SELECT
    {{ dbt_utils.star(ref("fct_registred_by_date"), except=["count"]) }}
FROM
    {{ ref("fct_registred_by_date") }}
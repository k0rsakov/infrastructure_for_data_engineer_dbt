{% macro cast_to_date(column_name) %}
    {{ column_name }}::date
{% endmacro %}